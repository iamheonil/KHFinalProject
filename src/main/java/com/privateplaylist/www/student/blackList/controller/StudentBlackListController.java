package com.privateplaylist.www.student.blackList.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/student")
public class StudentBlackListController {
	
	
	@RequestMapping("/blacklist")
	public String studentBlacklist(
											HttpSession session,
											@RequestParam(required = false, defaultValue = "1") int curPage, 
											@RequestParam(required = false, defaultValue="전체") String category, 
											@RequestParam(required = false, defaultValue="") String search
											) {
		
		
		System.out.println("신고 왔나");
		
		
		return "/student/blackList/blackList";
	}
		

}
