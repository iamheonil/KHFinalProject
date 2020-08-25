/**
 /* 이인주 20200825
 * 선생님 마이페이지 
 * 개인정보 확인 수정 탈퇴 
 */

package com.privateplaylist.www.teacher.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.profile.service.ProfileService;

@Controller
@RequestMapping("/teacher/profile")
public class ProfileController {

	@Autowired
	ProfileService profileService;
	
	//마이페이지 비밀번호 확인 jsp 
	@RequestMapping("/chkpassword")
	public String  chkpassword(HttpSession session) {
//		System.out.println("/teacher/profile/chkpassword");
		
		//세션값 가지고 오기
//		Member loginUser = (Member) session.getAttribute("loginUser");
		
//		System.out.println(loginUser);
//		System.out.println(loginUser.getUserNo());
		
		return "/teacher/profile/chkpassword";
	}	
	
	//비밀번호 확인 >> 되면 열람 jsp
	@RequestMapping("/chkpasswordRes")
	public String  chkpasswordRes(Model model, HttpServletRequest req, @RequestParam String userPw ,HttpSession session ) {
		System.out.println("/teacher/profile/chkpasswordRes");
	
		//root context
		String root = req.getContextPath();
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		//모델값 전달
//		model.addAttribute("noticeList", noticeList);
		
		return "/teacher/profile/chkpassword";
	}	
	
	
	//수정
	
	
	//탈퇴가능(탈퇴시 한번 더 물어보기)
	
	
}
