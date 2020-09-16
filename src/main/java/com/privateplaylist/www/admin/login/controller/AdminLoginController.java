package com.privateplaylist.www.admin.login.controller;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.admin.login.dao.AdminLoginDao;
import com.privateplaylist.www.admin.login.service.AdminLoginService;
import com.privateplaylist.www.dto.Admin;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

	@Autowired
	public AdminLoginService adminLoginService;

	@Autowired
	public AdminLoginDao adminLoginDao;

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("Login Call");

		return "/admin/admin";
	}
	
	// 로그인 시도
	@RequestMapping(value = "/loginImpl", method = POST)
	public ModelAndView loginImpl(@RequestParam Map<String, Object> adminMap, HttpSession session, HttpServletRequest request) {
		System.out.println("Login Post Call");
		
		System.out.println(adminMap);

		ModelAndView mav = new ModelAndView();
		Admin res = adminLoginService.selectAdmin(adminMap);
		
		if (res != null) {
			// 로그인 성공
			session.removeAttribute("loginUser");//관라저 로그인 시 회원 로그아웃
			session.setAttribute("loginAdmin", res);
			Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
			System.out.println("담은거 : " + loginAdmin);
			mav.setViewName("redirect:lesson/view");
			System.out.println("로그인 성공");
		} else {
			// 로그인 실패
			mav.setViewName("redirect:login");
			System.out.println("로그인 실패");
		}

		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logOut(HttpSession session) {
		
		adminLoginService.logOut(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:login");
		
		return mav;
		
	}
	
}
