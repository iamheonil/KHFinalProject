package com.privateplaylist.www.student.market.controller;

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
import com.privateplaylist.www.student.market.service.MarketStuService;

import common.util.Paging;

@Controller
@RequestMapping("/student")
public class marketStuController {
	
	@Autowired
	private MarketStuService marketStuService;

	@RequestMapping(value = "/market", method = RequestMethod.GET)
	public ModelAndView signStudent(HttpSession session, @RequestParam(required = false, defaultValue = "1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");
		
		int userNo = 6;
		
		Paging paging = marketStuService.getPagingMarketStu(curPage, userNo);
		
		List<Map<String, Object>> list = marketStuService.selectMarketStu(paging, userNo);
		
		System.out.println(list);
		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("teacher/connectedLesson/signStudent");
		mav.setViewName("student/market/marketlist");
		
		return mav;
	}
}
