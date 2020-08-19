package com.privateplaylist.www.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class BlackListController {
	
	@Autowired
	private BlackListService blackListService;
	
	@RequestMapping("/blacklist")
	public ModelAndView blackList() {
		
		ModelAndView mav = new ModelAndView();
		
		
		
		
		
		mav.setViewName("admin/blackList");
		return mav;
	}

}
