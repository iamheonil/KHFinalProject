package com.privateplaylist.www.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.privateplaylist.www.dto.TeacherFile;
import com.privateplaylist.www.member.service.MemberService;
import com.privateplaylist.www.member.vo.Member;
/**
* Handles requests for the application home page.
*/
import com.privateplaylist.www.member.vo.NaverLogin;

@Controller
@RequestMapping("/naver")
public class NaverLoginController {
	
	/* NaverLogin */
	private NaverLogin naverLogin;
	private String apiResult = null;
	
	@Autowired
	public MemberService memberService;

	@Autowired
	private void setNaverLogin(NaverLogin naverLogin) {
		this.naverLogin = naverLogin;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(Model model, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLogin클래스의 getAuthorizationUrl 메소드 호출 */
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버 : " + naverAuthUrl);

		// 네이버

		mav.addObject("url", naverAuthUrl);
		mav.setViewName("/member/naverlogin");

		return mav;
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLogin.getAccessToken(session, code, state);

		ModelAndView mav = new ModelAndView();

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLogin.getUserProfile(oauthToken); // String형식의 json데이터

		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		// 네이버에서 주는 고유 ID
		String naverId = (String) response_obj.get("id");
		// 네이버에서 설정된 사용자 이름
		String naverName = (String) response_obj.get("name");
		// 네이버에서 설정된 이메일
		String naverEmail = (String) response_obj.get("email");
		
		/*
		 * // 랜덤숫자 자리수 초기화(2자리) DecimalFormat decimal2Format = new DecimalFormat("00");
		 * // 랜덤숫자 자리수 초기화(3자리) DecimalFormat decimal3Format = new DecimalFormat("000");
		 * // 랜덤숫자 자리수 초기화(4자리) DecimalFormat decimal4Format = new DecimalFormat("0000");
		 */

		// 회원정보 세팅
		Member member = new Member();
		member.setUserId(naverId);
		member.setUserName(naverName);
		member.setUserEmail(naverEmail);
		
		// 네이버에서 주는 고유 ID의 중복여부 체크
		int naverIdCheck = memberService.selectId(naverId);

		// 회원 정보가 있다면?
		Map<String, Object> memberMap = new HashMap<>();
		memberMap.put("userId", naverId);
		memberMap.put("userName", naverName);
		memberMap.put("userEmail", naverEmail);
		memberMap = response_obj;
		
		System.out.println("멤버맵 출력" + memberMap);
		
		String userId = (String) memberMap.get("userId");
		
		// 중복되는 ID가 없을 경우 신규가입으로 아래 구문을 실행
		if (naverIdCheck == 0) {
				session.setAttribute("naverUser", member);
				System.out.println("새롭게 담아본 거" + member);
				mav.addObject("url", request.getContextPath() + "/naver/naverjoin");
				mav.setViewName("redirect:/naver/naverjoin");
				System.out.println("회원가입 페이지 이동 완료");
			} else {
				Member res = memberService.selectNaverMember(naverId);
				TeacherFile teacherFile = memberService.selectTeacherFile(naverId);
				session.setAttribute("loginUser", res);
				session.setAttribute("teacherFile", teacherFile);
				Member loginUser = (Member) session.getAttribute("loginUser");
				TeacherFile loginTeacher = (TeacherFile) session.getAttribute("teacherFile");
				System.out.println("담은거 : " + loginUser);
				System.out.println("담은거 : " + loginTeacher);
				mav.addObject("url", request.getContextPath() + "/main/index");
				mav.setViewName("redirect:/member/main");
				System.out.println("로그인 성공");
			}

		return mav;
	}

	// 네이버 회원가입 이동
	@RequestMapping(value = "/naverjoin", method = RequestMethod.GET)
	public String getFindPw() {
		// System.out.println("findpw Call");

		return "/member/naverjoin";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}
}
