package com.privateplaylist.www.admin.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.admin.board.service.BlackListService;

@Controller
@RequestMapping("/admin")
public class BlackListController {
	
	@Autowired
	private BlackListService blackListService;
	
	@RequestMapping("/blacklist")
	public ModelAndView blackList() {
		
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> list = blackListService.selectAllBlackList();
		mav.addObject("list", list);
		mav.setViewName("admin/blackList");
		return mav;
	}
	
	@RequestMapping("/blacklist/turndown")
	public ModelAndView turndown() {
		
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> list = blackListService.selectAllBlackList();
		mav.addObject("list", list);
		mav.setViewName("admin/blackList");
		return mav;
	}

}
