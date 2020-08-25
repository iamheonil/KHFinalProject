package com.privateplaylist.www.teacher.webShare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher/webshare")
public class WebShareController {

	@RequestMapping("/list")
	public String webShareList() {
		
		System.out.println("webshare 접속 테스트");
		
		return "/teacher/webShare/list";
	} 
	
	
}
