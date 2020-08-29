/**
 /* 이인주 20200825
 * 선생님 마이페이지 
 * 개인정보 확인 수정 탈퇴 
 */

package com.privateplaylist.www.teacher.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.TeacherFile;
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
	@RequestMapping(value = "/chkpasswordRes", produces = "application/text; charset=utf-8")
	public String chkpasswordRes(Model model, HttpServletRequest req, @RequestParam String userPw ,HttpSession session, HttpServletResponse resp) {
//		System.out.println("/teacher/profile/chkpasswordRes");
	
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
//		System.out.println("/teacher/profile/select");
	
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//사진 가지고 오기
		TeacherFile teacherFile = profileService.selectFile(loginUser);
		
		//모델값 전달
		model.addAttribute("loginUser", loginUser);
		
		//jsp 전달
		model.addAttribute("teacherFile", teacherFile);
		
//		System.out.println(loginUser);
		
		return "/teacher/profile/select";
	}	
	
	
	//수정
	//마이페이지 개인정보 수정
	//FileUtil을 이용하여 파일 insert
	@RequestMapping("/update")
	public String profileUpdate(@RequestParam MultipartFile file, HttpSession session, Member member) {
		
//		System.out.println("/teacher/profile/update");
//		System.out.println("member"+member);
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//저장 경로
		String root = session.getServletContext().getRealPath("/");
		
		//사진 가지고 오기
		TeacherFile teacherFile = profileService.selectFile(loginUser);
		
		//개인정보 update + 파일 insert 
		int res = profileService.updateProfile(member,file,root,loginUser,teacherFile);
		
		//성공적으로 수정하면 세션 생성
		if(res > 0) {
			//디비에서 값 가지고오기
			Member newmember =  profileService.selectonenew(loginUser);
			
//			System.out.println(newmember);
			
			//세션값 변경
			session.setAttribute("loginUser", newmember);
			
			return "teacher/profile/chkpassword";
			
		}else {
			return "teacher/profile/select";
		}
		
	}
	
	//탈퇴
	
}
