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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String  chkpassword(Model model,HttpSession session) {
//		System.out.println("/teacher/profile/chkpassword");
		return "/teacher/profile/chkpassword";
	}	
	
	
	//ajax
	//한글 인코딩 확인
	//비밀번호 확인 >> 되면 열람 jsp
	@ResponseBody
	@RequestMapping("/chkpasswordRes")
	public String chkpasswordRes(Model model, HttpServletRequest req, @RequestParam String userPw ,HttpSession session ) {
		System.out.println("/teacher/profile/chkpasswordRes");
	
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "로그아웃 되었습니다. 다시 로그인 바랍니다.";
		}
		
		//비밀번호 일치 여부 확인
		int res = profileService.chkpassword(loginUser,userPw);
		
		if(res > 1) {
			//결과가 1보다 크면  ""
			return "";
		}else {
			//결과가 1보다 작으면 "비밀번호가 일치하지 않습니다."
			return "비밀번호가 일치하지 않습니다.";
		}
	
	}	
	
	//마이페이지 열람
	@RequestMapping("/select")
	public String selectProfile(Model model, HttpServletRequest req,HttpSession session ) {
		System.out.println("/teacher/profile/select");
	
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//세션의 아이디 값으로 select membership 해오기
		

		return "/teacher/profile/select";
	}	
	
	
	//수정
	
	
	//탈퇴가능(탈퇴시 한번 더 물어보기)
	
	
}
