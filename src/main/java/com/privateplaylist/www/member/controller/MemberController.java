package com.privateplaylist.www.member.controller;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
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

import com.privateplaylist.www.member.dao.MemberDao;
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
	public String login() {
		System.out.println("Login Call");

		return "/member/login";
	}

	@RequestMapping(value = "/loginImpl", method = POST)
	public ModelAndView loginImpl(@RequestParam Map<String, Object> memberMap, HttpSession session, HttpServletRequest request) {
		System.out.println("Login Post Call");
		
		System.out.println(memberMap);

		ModelAndView mav = new ModelAndView();
		Member res = memberService.selectMember(memberMap);
		
		if (res != null) {
			// 로그인 성공
			session.setAttribute("loginUser", res);
			Member loginUser = (Member) session.getAttribute("loginUser");
			System.out.println("담은거 : " + loginUser);
			mav.addObject("url", request.getContextPath() + "/main/index");
			mav.setViewName("redirect:main");
			System.out.println("로그인 성공");
		} else {
			// 로그인 실패
			mav.addObject("url", request.getContextPath() + "/member/login.do");
			mav.setViewName("/member/login");
			System.out.println("로그인 실패");
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
	public ModelAndView joinEmail(@ModelAttribute Member member, HttpServletRequest req) {

		String root = req.getContextPath();
		ModelAndView mav = new ModelAndView();

		int res = memberService.insertMember(member);

		if (res < 0) {
			System.out.println("회원가입 실패");
			mav.setViewName("redirect:join");
		} else {
			System.out.println("회원가입 성공");
			mav.setViewName("redirect:login");
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
	public String findId() {
		// System.out.println("findid Call");

		return "/member/findid";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findPw() {
		// System.out.println("findpw Call");

		return "/member/findpw";
	}
	
	@RequestMapping("/logout")
	public ModelAndView logOut(HttpSession session) {
		
		memberService.logOut(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		
		return mav;
		
	}
	

}
