package com.privateplaylist.www.admin.lesson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.lesson.service.FindStudentService;


@Controller
@RequestMapping("/admin/lesson")
public class FindStudentController {
	
	
	@Autowired
	private FindStudentService findStudentService;
	
	
	@RequestMapping("/findstudent")
	public String findStudent(Model model){
		
		//학생찾기 게시글 조회
		List<Map<String, Object>> findStudent = findStudentService.selectFindStudent();
		
		System.out.println(findStudent);
		
		model.addAttribute("findStudent", findStudent);
		
		return "/admin/lesson/findStudent";
	}
	

}
