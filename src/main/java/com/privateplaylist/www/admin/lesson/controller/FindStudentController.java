package com.privateplaylist.www.admin.lesson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.lesson.service.FindStudentService;
import com.privateplaylist.www.student.findStu.service.FindStuService;
import com.privateplaylist.www.user.lesson.findStudent.service.UserFindStuService;


@Controller
@RequestMapping("/admin/lesson")
public class FindStudentController {
	
	
	@Autowired //학생찾기 목록
	private FindStudentService findStudentService;
	
	@Autowired //학생찾기 상세
	private UserFindStuService userFindStuService;
	
	@Autowired //학생찾기 삭제
	private FindStuService findStuService;
	
	
	
	@RequestMapping("/findstudent")
	public String findStudent(Model model){
		
		//학생찾기 게시글 조회
		List<Map<String, Object>> findStudent = findStudentService.selectFindStudent();
		
//		System.out.println(findStudent);
		
		model.addAttribute("findStudent", findStudent);
		
		return "/admin/lesson/findStudent";
	}
	
	
	//학생찾기글 상세 - 창 띄우기
	@RequestMapping("/findstudent/detail")
	public String findStudentDetail(Model model, int no) {
		
//		System.out.println("왔냐? 왔네"); 
		
		//학생찾기 게시글 상세 조회
		Map<String, Object> findStuDetail = userFindStuService.detailFindStu(no);
		
//		System.out.println(findStuDetail);
		
		model.addAttribute("findStu", findStuDetail);
		
		return "/admin/lesson/findStuDetail";
	}
	
	
	//학생찾기글 상세 - 삭제
	@RequestMapping("/findstudent/delete")
	public String findStudentDelete(Model model, int no) {
		
//		System.out.println("학생찾기 삭제 왔냐?"); 
		
		//학생찾기 게시글 상세 조회 - 삭제
		int res = findStuService.deleteFindStu(no);
//		System.out.println(no);
		
		return "/admin/lesson/findStudent";
	}

}
