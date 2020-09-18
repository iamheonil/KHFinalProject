package com.privateplaylist.www.member.controller;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.TeacherFile;
import com.privateplaylist.www.member.dao.MemberDao;
import com.privateplaylist.www.member.service.KakaoLoginApi;
import com.privateplaylist.www.member.service.MemberService;
import com.privateplaylist.www.member.vo.Member;

import common.exception.FileException;
import common.exception.MailException;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	public MemberService memberService;

	@Autowired
	public MemberDao memberDao;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		System.out.println("Login Call");
		
		ModelAndView mav = new ModelAndView();
		
		String kakaoUrl = KakaoLoginApi.getAuthorizationUrl(session);
		
		mav.addObject("kakao_url", kakaoUrl);
		mav.setViewName("/member/login");
		
		return mav;
	}

	@RequestMapping(value = "/loginImpl", method = POST)
	public ModelAndView loginImpl(@RequestParam Map<String, Object> memberMap, HttpSession session, HttpServletRequest request) {
		System.out.println("Login Post Call");
		
		// System.out.println(memberMap);

		ModelAndView mav = new ModelAndView();
		Member res = memberService.selectMember(memberMap);
		String userId = (String) memberMap.get("userId");
		String root = request.getContextPath();
		
		TeacherFile teacherFile = memberService.selectTeacherFile(userId);
		
		if (res != null) {
			// 로그인 성공
			session.removeAttribute("loginAdmin");//관리자 로그아웃
			session.setAttribute("loginUser", res);
			session.setAttribute("teacherFile", teacherFile);
			// Member loginUser = (Member) session.getAttribute("loginUser");
			// TeacherFile loginTeacher = (TeacherFile) session.getAttribute("teacherFile");
			// mav.addObject("alertMsg", "회원가입에 실패하였습니다.");
			mav.addObject("url", root + "/member/main");
			mav.setViewName("/member/result");
			// System.out.println("로그인 성공");
		} else {
			// 로그인 실패
			mav.addObject("alertMsg", "로그인에 실패했습니다. 아이디, 비밀번호를 확인해주세요");
			mav.addObject("url", root + "/member/login");
			mav.setViewName("/member/result");
			// System.out.println("로그인 실패");
		}

		return mav;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("Going Main");

		return "/main/index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("Join Call");

		return "/member/join";
	}

	@RequestMapping(value = "/joinImpl", method = POST)
	public ModelAndView joinEmail(@ModelAttribute Member member, HttpServletRequest request) {

		String root = request.getContextPath();
		ModelAndView mav = new ModelAndView();

		int res = memberService.insertMember(member);

		if (res < 0) {
			System.out.println("회원가입 실패");
			mav.addObject("alertMsg", "회원가입에 실패하였습니다.");
			mav.addObject("url", root + "/member/join");
			mav.setViewName("/member/result");
		} else {
			System.out.println("회원가입 성공");
			mav.addObject("alertMsg", "회원가입에 성공하였습니다.");
			mav.addObject("url", root + "/member/login");
			mav.setViewName("/member/result");
		}
		return mav;
	}

	//uuid생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	// 파일 업로드
	@RequestMapping(value = "/jointeacher", method = POST)
	public ModelAndView fileUpload(@RequestParam("joinFiles") MultipartFile files, Map<String, String> fileInfo, HttpSession session, @ModelAttribute Member member, HttpServletRequest request) throws FileException, MailException {

		ModelAndView mav = new ModelAndView();

		String root = session.getServletContext().getRealPath("/resources/upload/");

		memberService.insertMember(member);

		String userId = member.getUserId();
		String tch_File_Org = files.getOriginalFilename();
		String tch_File_OrgExt = files.getOriginalFilename().substring(files.getOriginalFilename().lastIndexOf("."));
		String tch_File_Rename = getUuid() + tch_File_OrgExt;
		String save_Path = root;

		System.out.println("파일 저장 경로 : " + root);
		System.out.println("파일 리 네임 : " + tch_File_Rename);
		
		fileInfo.put("userId", userId);
		fileInfo.put("tch_File_Org", tch_File_Org);
		fileInfo.put("tch_File_Rename", tch_File_Rename);
		fileInfo.put("save_Path", save_Path);
		
		memberService.insertTeacherFile(files, fileInfo, save_Path);
		
		File upFile = new File(save_Path, tch_File_Rename);
		
		try {
			files.transferTo(upFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		mav.setViewName("/member/login");
		return mav;
	}


	@RequestMapping("/send")
	public ModelAndView joinEmailCheck(String email, int code_check) throws MailException {

		ModelAndView mav = new ModelAndView();

		memberService.mailSending(email, code_check);

		System.out.println("메일 발송 성공");
		

		return mav;
	}

	@RequestMapping("/joinresult")
	public ModelAndView joinResultTest(Member member, HttpServletRequest request) throws MailException {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/member/join_result");

		return mav;
	}

	@RequestMapping("/idcheck")
	@ResponseBody
	public String idCheck(String userId) {
		System.out.println(userId);

		int res = memberService.selectId(userId);

		if (res > 0) {
			return userId;
		} else {
			return "";
		}

	}

	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String getFindId() {
		// System.out.println("findid Call");

		return "/member/findid";
	}

	@RequestMapping(value = "/findidAjax", method = RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam Map<String, Object> memberMap) {
		// System.out.println(memberMap);
		
		Member member = memberService.findId(memberMap);
		String result = "";

		if(member != null) {
			String res = member.getUserId();
		
			if (res.equals(null)) {
				return "null";
			} else {
				result = member.getUserId();
			}
		}
		return result;
	}
	
//	@RequestMapping(value = "/findAjaxid", method = RequestMethod.POST)
//	public Member findId(@RequestParam Map<String, Object> memberMap) {
//		System.out.println(memberMap);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		
//		
//		return memberService.findId(memberMap);
//	}

	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String getFindPw() {
		// System.out.println("findpw Call");

		return "/member/findpw";
	}

	@RequestMapping(value = "/findpwAjax", method = RequestMethod.POST)
	@ResponseBody
	public String FindPw(@RequestParam Map<String, Object> memberMap) {
		
		Member member = memberService.findPw(memberMap);
		String result = "";

		if(member != null) {
			String res = member.getUserPw();
		
			if (res.equals(null)) {
				return "null";
			} else {
				result = member.getUserPw();
			}
		}
		return result;
	}
	
	@RequestMapping("/pwModify")
	public ModelAndView modifyPw(Member member) {
		
		ModelAndView mav = new ModelAndView();
		
		int res = memberService.modifyPw(member);
		
		if (res < 0) {
			System.out.println("비밀번호 수정 실패");
			mav.setViewName("redirect:findpw");
		} else {
			System.out.println("비밀번호 수정 성공");
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logOut(HttpSession session) {
		
		memberService.logOut(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		
		return mav;
		
	}
	

}
