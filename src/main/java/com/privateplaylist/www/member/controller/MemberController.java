package com.privateplaylist.www.member.controller;

import java.util.List;
import java.util.Map;

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

import com.privateplaylist.www.member.service.MemberService;
import com.privateplaylist.www.member.vo.Member;

import common.exception.MailException;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	public MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("Login Call");

		return "/member/login";
	}

	@RequestMapping(value = "/loginImpl", method = RequestMethod.POST)
	public ModelAndView loginImpl(@RequestParam Map<String, Object> memberMap, HttpSession session, HttpServletRequest request) {
		System.out.println("Login Post Call");

		ModelAndView mav = new ModelAndView();
		Member res = memberService.selectMember(memberMap);
		
		if (res != null) {
			// 로그인 성공
			session.setAttribute("loginUser", res);
			mav.addObject("url", request.getContextPath() + "/main/index");
			mav.setViewName("/main/index");
			System.out.println("로그인 성공");
		} else {
			// 로그인 실패
			mav.addObject("url", request.getContextPath() + "/member/login.do");
			mav.setViewName("/member/login");
			System.out.println("로그인 실패");
		}

		return mav;
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("Join Call");

		return "/member/join";
	}

	@RequestMapping(value = "/joinImpl", method = RequestMethod.POST)
	public ModelAndView joinEmail(@RequestParam List<MultipartFile> files, @ModelAttribute Member member,
			HttpServletRequest req) {

		String root = req.getContextPath();
		ModelAndView mav = new ModelAndView();

		int res = memberService.insertMember(member);

		if (res < 0) {
			System.out.println("회원가입 실패");
			mav.setViewName("/member/join");
		} else {
			System.out.println("회원가입 성공");
			mav.setViewName("/member/login");
		}
		return mav;
	}

	@RequestMapping("/joinemail")
	public ModelAndView joinEmailCheck(Member member, HttpServletRequest request) throws MailException {

		ModelAndView mav = new ModelAndView();
		String urlPath = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

		memberService.mailSending(member, urlPath);

		System.out.println("메일 발송 성공");
		mav.setViewName("/member/login");

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

}
