package com.privateplaylist.www.admin.lesson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.lesson.service.LessonViewService;

@Controller
@RequestMapping("/admin/lesson")
public class LessonViewController {

	@Autowired
	private LessonViewService lessonViewService;

	
	@RequestMapping("/view")
	public String lessonView(Model model){
		
		System.out.println("view 접속 테스트");
		
		//과외 전체 조회
		List<Map<String, Object>> lessonList = lessonViewService.selectLessonAll();
		
		System.out.println(lessonList);
		
		model.addAttribute("lessonList", lessonList);
		
		
		return "/admin/lesson/lessonViewAll";
	}

}
