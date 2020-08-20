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
    @RequestMapping("/stuManage")
    public ModelAndView stuList(@RequestParam(required=false, defaultValue="1") int cPage) {
        
    	ModelAndView mav = new ModelAndView();
		int cntPerPage = 10;
		Map<String, Object> commandMap = adminmMemberService.selectStuList(cPage, cntPerPage);
		
		//paging객체를 paging이라는 키로 담아서 보낸다.
		mav.addObject("paging", commandMap.get("paging"));
		mav.addObject("stuData", commandMap);
		mav.setViewName("admin/stuManage");
		return mav;
    	
    }
	
    @RequestMapping("/stuDetail")
    public String stuDetail(int userno) {
    	return "admin/stuManage";
    }
	


}
