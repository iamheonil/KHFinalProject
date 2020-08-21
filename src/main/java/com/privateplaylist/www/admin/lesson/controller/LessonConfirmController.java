package com.privateplaylist.www.admin.lesson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.lesson.service.LessonConfirmService;

@Controller
@RequestMapping("/admin/lesson")
public class LessonConfirmController {

	
	@Autowired
	private LessonConfirmService lessonConfirmService;
	
	
	@RequestMapping("/confirm")
	public String lessonConfirm(Model model){
		
//		System.out.println("confirm 연결 테스트");
		
		//검토할 과외 조회
		List<Map<String, Object>> confirmList = lessonConfirmService.selectConfirmLesson();
		
		System.out.println(confirmList);
		
		model.addAttribute("confirmList", confirmList);
		
		return "/admin/lesson/lessonConfirm";
	}
	
	
	@RequestMapping("/detailView")
	public String lessonDetail(Model model) {
		
		
		return null;
	}
	
	
	
}
