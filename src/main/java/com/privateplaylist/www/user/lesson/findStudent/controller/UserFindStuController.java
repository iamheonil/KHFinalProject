package com.privateplaylist.www.user.lesson.findStudent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.user.lesson.findStudent.service.UserFindStuService;

//이인주 : user > find_student > Controller

@Controller
@RequestMapping("/lesson/findStu")
public class UserFindStuController {
	
	@Autowired
	UserFindStuService userFindStuService;
	
	//학생 찾기 
	@RequestMapping("/list")
	public String  userFindStuList(Model model) {
		System.out.println("/lesson/findStu/list");
			
		return "user/lesson/findStu/list";
	}

}
