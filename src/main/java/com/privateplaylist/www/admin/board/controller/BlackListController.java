package com.privateplaylist.www.admin.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		Paging paging = blackListService.getPagingBlack(curPage, search);
		
		List<Map<String, Object>> list = blackListService.selectAllBlackList(paging);
		
		int blackCnt = blackListService.selectReportCnt();
		
		mav.addObject("search", search);
		mav.addObject("blackCnt", blackCnt);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("admin/blackList/blackList");
		return mav;
	}
	
	
	
	
	@RequestMapping("/blacklist/turndown")
	@ResponseBody
	public String turndown(@RequestParam(value="list[]", required = false) List<Integer> list) {
		
		System.out.println(list);
		
		if( list == null ) {
			return "0";
		}
		blackListService.turndown(list);
		
		return "1";
	}

	@RequestMapping("/blacklist/deletereview")
	@ResponseBody
	public String deleteReview(@RequestParam(value="list[]", required = false) List<Integer> list) {
		if( list == null ) {
			return "0";
		}
		blackListService.deleteReview(list);
		return "1";
		
	}

}