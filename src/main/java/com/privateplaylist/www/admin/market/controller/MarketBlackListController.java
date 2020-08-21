package com.privateplaylist.www.admin.market.controller;

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
public class MarketBlackListController {
	
	@Autowired
	private BlackListService blackListService;
	
	@RequestMapping("/market/blacklist")
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
	
	
	
	
	@RequestMapping("/market/blacklist/turndown")
	public ModelAndView turndown(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		if( req.getParameterValues("checkRow") == null ) {
			
			mav.addObject("msg", "1개 이상 선택해주십시오");
			mav.addObject("url", req.getContextPath() + "/admin/blacklist");
			mav.setViewName("admin/blackList/alertPage");
			
			return mav;
		}
		blackListService.turndown(req);
		
		mav.setViewName("redirect:/admin/blacklist");
		return mav;
	}

	@RequestMapping("/market/blacklist/deletereview")
	public ModelAndView deleteReview(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		if( req.getParameterValues("checkRow") == null ) {
			
			mav.addObject("msg", "1개 이상 선택해주십시오");
			mav.addObject("url", req.getContextPath() + "/admin/blacklist");
			mav.setViewName("admin/blackList/alertPage");
			
			return mav;
		}
		
		blackListService.deleteReview(req);
		
		mav.setViewName("redirect:/admin/blacklist");
		return mav;
	}

}