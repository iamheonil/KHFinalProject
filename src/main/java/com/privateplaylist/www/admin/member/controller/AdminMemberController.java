package com.privateplaylist.www.admin.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.admin.member.service.AdminMemberService;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	AdminMemberService adminmMemberService;

//    @RequestMapping("/student")
//    public String stuManage() {
//        
//    	
//    	
//        return "admin/stuManage";
//    }
    @RequestMapping("/stuList")
    public ModelAndView stuList(@RequestParam(required=false, defaultValue="1") int cPage) {
        
    	ModelAndView mav = new ModelAndView();
		int cntPerPage = 10;
		Map<String, Object> commandMap = adminmMemberService.selectStuList(cPage, cntPerPage);
		
		//paging��ü�� paging�̶�� Ű�� ��Ƽ� ������.
		mav.addObject("paging", commandMap.get("paging"));
		mav.addObject("stuData", commandMap);
		mav.setViewName("admin/member/stuList");
		return mav;
    	
    }
	
	@RequestMapping("/studetail")
	public ModelAndView noticeDetail(int userNo) {
		System.out.println("/studetail");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> commandMap = adminmMemberService.selectStuDetail(userNo);
		//해당 게시글이 존재하는 지 여부 판단
		//반환되는 Map은 null일 수 없다.
		//Map안의 notice객체가 null인지 여부로 판단.
		if(commandMap.get("member") != null) {
			mav.addObject("data", commandMap);
			mav.setViewName("admin/member/stuDetail");
		}else {
			mav.addObject("alertMsg", "탈퇴한 회원입니다.");
//			mav.addObject("url", "board/boardList");
//			mav.setViewName("common/result");
		}
		
		return mav;
	}
	


}
