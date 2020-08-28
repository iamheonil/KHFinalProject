package com.privateplaylist.www.member.controller;

import java.io.IOException;
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
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
			throws IOException, ParseException {
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

		// 값 파싱
		// String nickname = (String) response_obj.get("nickname");
		Map<String, Object> memberMap;
		
		memberMap = response_obj;

		// 4.파싱 닉네임 세션으로 저장
		model.addAttribute("result", apiResult);
		
		session.setAttribute("loginUser", memberMap); // 세션 생성
		System.out.println("담은거 : " + memberMap);
		mav.addObject("url", request.getContextPath() + "/main/index");
		mav.setViewName("redirect:/member/main");
		System.out.println("로그인 성공");
		
		
		System.out.println("여기까지");
		
		return mav;
	}

	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}
}
