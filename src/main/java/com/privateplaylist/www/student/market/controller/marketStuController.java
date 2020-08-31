package com.privateplaylist.www.student.market.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/student")
public class marketStuController {

	@RequestMapping(value = "/market", method = RequestMethod.GET)
	public ModelAndView signStudent(HttpSession session, @RequestParam(required = false, defaultValue = "1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("student/market/marketlist");
		
		return mav;
	}
}
