package com.privateplaylist.www.user.lesson.findStudent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.user.lesson.findStudent.service.UserFindStuService;

@Controller
@RequestMapping("/lesson/findStu")
public class UserFindStuController {
	
	@Autowired
	UserFindStuService userFindStuService;
	
	

}
