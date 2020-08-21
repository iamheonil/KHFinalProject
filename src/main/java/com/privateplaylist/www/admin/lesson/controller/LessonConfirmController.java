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
		
//		System.out.println(confirmList);
		
		model.addAttribute("confirmList", confirmList);
		
		return "/admin/lesson/lessonConfirm";
	}
	
	
	
	//과외글 상세 - 모달창 띄우기
	@RequestMapping("/confirm/detail")
	public String lessonDetail(Model model, int no) {
		
//		System.out.println("왔냐? 왔네"); 
		
		//과외글 상세 조회
		Map<String, Object> lessonDetail = lessonConfirmService.selectLessonDetail(no);
		
		model.addAttribute("lessonDetail", lessonDetail);
		
		return "/admin/lesson/lessonDetail";
	}
	
	
	
	//과외 승인
	@RequestMapping("/confirm/admit")
	public String lessonAdmit(Model model, int no) {
		
//		System.out.println(no);
		
		int res = lessonConfirmService.updateLessonStateAdmit(no);
		
		if(res > 0) {
			
			return "redirect:/admin/lesson/confirm";
			
		} else { 
		
			return "승인 실패"; 
		}
		
	}
	
	
	//과외 반려
	@RequestMapping("/confirm/deny")
	public String lessonDeny(Model model, int no) {
		
//		System.out.println(no);
		
		int res = lessonConfirmService.updateLessonStateDeny(no);
		
		if(res > 0) {
			
			return "redirect:/admin/lesson/confirm";
			
		} else { 
		
			return "반려 실패"; 
		}
	}
	
	
	
	
	
}
