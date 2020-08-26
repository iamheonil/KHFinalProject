package com.privateplaylist.www.teacher.lesson;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/teacher")
public class LessonController {
	
	@RequestMapping("/caution")
	public ModelAndView caution() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("teacher/lesson/caution");
		
		return mav;
	}

	@RequestMapping("/writelesson")
	public ModelAndView writeLesson() {

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("teacher/lesson/writeLesson");
		
		return mav;
	}

}
