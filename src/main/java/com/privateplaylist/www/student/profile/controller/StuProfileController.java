package com.privateplaylist.www.student.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.profile.service.StuProfileService;
import com.privateplaylist.www.teacher.profile.service.ProfileService;

@Controller
@RequestMapping("/student/profile")
public class StuProfileController {
	
	@Autowired
	StuProfileService stuProfileService;
	
	@Autowired
	ProfileService profileService;
	
	//마이페이지 비밀번호 확인 jsp 
	@RequestMapping("/chkpassword")
	public String  chkpassword(Model model,HttpSession session) {
//		System.out.println("/student/profile/chkpassword");
		return "/student/profile/chkpassword";
	}	
	
	//ajax
	//한글 인코딩 확인
	//비밀번호 확인 >> 되면 열람 jsp
	//선생님과 동일
	
	
	//마이페이지 열람 
	@RequestMapping("/select")
	public String selectProfile(Model model, HttpServletRequest req,HttpSession session ) {
//			System.out.println("/student/profile/select");
	
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//모델값 전달
		model.addAttribute("loginUser", loginUser);
		
		return "/student/profile/select";
	}	
	
	//수정
	//마이페이지 개인정보 수정
	@RequestMapping("/update")
	public String profileUpdate(HttpSession session, Member member) {
		
//			System.out.println("/student/profile/update");
//			System.out.println("member"+member);
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//개인정보 update 
		int res = stuProfileService.updateProfile(member,loginUser);
		
		//성공적으로 수정하면 세션 생성
		if(res > 0) {
			//디비에서 값 가지고오기( 선생님과 동일 )
			Member newmember =  profileService.selectonenew(loginUser);
			
			newmember.setUserGender(member.getUserGender());
			
			String gender = member.getUserGender();
			
			//세션값 변경
			session.setAttribute("loginUser", newmember);
			
			return "student/profile/chkpassword";
			
		}else {
			return "student/profile/select";
		}
		
	}
	
	//탈퇴
	@RequestMapping("/delete")
	public String profileDelete(HttpServletRequest req,HttpSession session,@RequestParam int userNo, Model model) {
		
//			System.out.println("/student/profile/delete");
//			System.out.println("userNo"+userNo);
		
		//root context
		String root = req.getContextPath();
		
		//연결된 과외가 있으면 탈퇴 불가
		//connected_lesson is_end  0 이면 불가 / 1 가능  
		
		//연결된 과외 개수
		int resCount = stuProfileService.countIsEnd(userNo);
		
		//연결된 과외가 있으면 
		if(resCount > 0) {
			
			model.addAttribute("alertMsg", "진행 중인 과외가 있습니다. 과외가 모두 종료된 후 탈퇴 가능합니다.");
			model.addAttribute("url", root+"/student/profile/chkpassword");

			return "/admin/notice/error";
			
		}else {
			
			//연결된 과외가 없으면 회원 탈퇴 (선생님과 동일 ) 
			//update is_leave > 1 
			int resDelete = profileService.deleteProfile(userNo);
			
			//탈퇴 성공
			if(resDelete > 0) {
				model.addAttribute("alertMsg", "회원탈퇴를 성공했습니다.");
				model.addAttribute("url", root+"/");

				return "/admin/notice/error";
			}else {
				model.addAttribute("alertMsg", "회원탈퇴를 실패하였습니다. 다시 시도해주시기 바랍니다.");
				model.addAttribute("url", root+"/teacher/profile/chkpassword");

				return "/admin/notice/error";
			}
			
		}
			
	}

}
