package com.privateplaylist.www.admin.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.admin.board.service.BlackListService;

import common.util.Paging;

@Controller
@RequestMapping("/admin")
public class BlackListController {
	
	@Autowired
	private BlackListService blackListService;
	
	@RequestMapping("/blacklist")
	public ModelAndView blackList(@RequestParam(required = false, defaultValue = "1") int curPage, @RequestParam(required = false, defaultValue="") String search) {
		
		ModelAndView mav = new ModelAndView();
		
		// 페이징 처리위한 객체
		Paging paging = blackListService.getPagingBlack(curPage);
		
		List<Map<String, Object>> list = blackListService.selectAllBlackList(paging);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("admin/blackList");
		return mav;
	}
	
	
	
	
	@RequestMapping("/blacklist/turndown")
	public ModelAndView turndown(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		
		blackListService.turndown(req);
		
		mav.setViewName("redirect:/admin/blacklist");
		return mav;
	}

	@RequestMapping("/blacklist/deletereview")
	public ModelAndView deleteReview(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		blackListService.deleteReview(req);
		
		mav.setViewName("redirect:/admin/blacklist");
		return mav;
	}

}