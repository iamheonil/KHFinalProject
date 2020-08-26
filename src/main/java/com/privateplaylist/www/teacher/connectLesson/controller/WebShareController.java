package com.privateplaylist.www.teacher.connectLesson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.teacher.connectLesson.service.WebShareService;

@Controller
@RequestMapping("/teacher")
public class WebShareController {

	@Autowired
	WebShareService webShareService;
	
	
	@RequestMapping("/connectedlesson")
	public String lessonList(Model model) {
		
//		System.out.println("lessonList 접속 테스트");
		
		int teaNo = 10;
		
		//연결된 과외 조회
		List<Map<String, Object>> connectedLessonList = webShareService.selectConnectedLesson(teaNo);
		
//		System.out.println(connectedLessonList);
		
		model.addAttribute("connectedLessonList", connectedLessonList);
		
		return "/teacher/connectedLesson/lessonList";
	} 
}
