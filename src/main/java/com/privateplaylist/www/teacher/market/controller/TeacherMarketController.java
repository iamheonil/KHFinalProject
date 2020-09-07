package com.privateplaylist.www.teacher.market.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.market.service.TeacherMarketService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher/market")
public class TeacherMarketController {

	
	@Autowired
	TeacherMarketService teacherMarketService;
	
	@RequestMapping(value = "/marketlist", method = RequestMethod.GET)
	public ModelAndView marketBoard(HttpSession session, @RequestParam(required = false, defaultValue = "1") int curPage1
								,@RequestParam(required = false, defaultValue = "1") int curPage2) {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
		int userNo = 1;
		Paging paging1 = teacherMarketService.getPagingMarketTea(curPage1, userNo);
		Paging paging2 = teacherMarketService.getPagingMarketCommTea(curPage2, userNo);
		
		List<Map<String, Object>> list1 = teacherMarketService.selectMarketTea(paging1, userNo);
		List<Map<String, Object>> list2 = teacherMarketService.selectMarketCommTea(paging2, userNo);
		
		mav.addObject("paging1", paging1);
		mav.addObject("list1", list1);
		
		mav.addObject("paging2", paging2);
		mav.addObject("list2", list2);
		mav.setViewName("teacher/market/marketlist");
			
//		System.out.println(list);
		
		return mav;
	}
	
	@RequestMapping(value = "/marketpage", method = RequestMethod.POST)
	public ModelAndView marketPaging(HttpSession session, @RequestParam int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
		int userNo = 6;
		
		Paging paging1 = teacherMarketService.getPagingMarketTea(curPage, userNo);
		List<Map<String, Object>> list1 = teacherMarketService.selectMarketTea(paging1, userNo);
		mav.addObject("paging1", paging1);
		mav.addObject("list1", list1);
		mav.setViewName("teacher/market/marketTable");
		
//		System.out.println(list);
		
		return mav;
	}

	@RequestMapping(value = "/marketcommpage", method = RequestMethod.POST)
	public ModelAndView marketCommPaging(HttpSession session, @RequestParam int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
		int userNo = 6;
		
		Paging paging2 = teacherMarketService.getPagingMarketCommTea(curPage, userNo);
		List<Map<String, Object>> list2 = teacherMarketService.selectMarketCommTea(paging2, userNo);
		mav.addObject("paging2", paging2);
		mav.addObject("list2", list2);
		mav.setViewName("teacher/market/marketCommTable");
		
		
		return mav;
	}
	
	
	
	
}