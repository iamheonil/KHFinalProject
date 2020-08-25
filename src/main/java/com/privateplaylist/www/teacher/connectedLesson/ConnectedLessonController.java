package com.privateplaylist.www.teacher.connectedLesson;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/teacher")
public class ConnectedLessonController {
	
	
	@RequestMapping("/connectlesson")
	public ModelAndView connectLession() {

		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("teacher/connectedLesson/connectedLesson");
		
		return mav;
	}

	@RequestMapping("/signstu")
	public ModelAndView signStudent() {
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("teacher/connectedLesson/signStudent");
		
		return mav;
	}

}
//