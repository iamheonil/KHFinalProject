package com.privateplaylist.www.teacher.connectLesson.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.teacher.connectLesson.service.ConnectLessonService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher")
public class ConnectLessonController {
	
	private ConnectLessonService connectLessonService;
	
	@RequestMapping("/connectlesson")
	public ModelAndView connectLession() {

		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("teacher/connectedLesson/connectedLesson");
		
		return mav;
	}
	
	@RequestMapping("/signstu")
	public ModelAndView signStudent(HttpSession session, @RequestParam(required = false, defaultValue = "1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
//		Membership m = (Membership) session.getAttribute("loginUser");
		
		int userNo = 6;
		
		Paging paging = connectLessonService.getPagingCntLesson(curPage, userNo);
		
		List<Map<String, Object>> list = connectLessonService.selectConnectStu(paging);
		
		mav.setViewName("teacher/connectedLesson/signStudent");
		
		return mav;
	}

}
