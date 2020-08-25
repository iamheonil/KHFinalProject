package com.privateplaylist.www.teacher.connectLesson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.teacher.connectLesson.service.ConnectLessonService;

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
	public ModelAndView signStudent() {
		
		ModelAndView mav = new ModelAndView();
		
//		List<Map<String, Object>> list = connectLessonService.selectConnectStu();
		
		mav.setViewName("teacher/connectedLesson/signStudent");
		
		return mav;
	}

}
