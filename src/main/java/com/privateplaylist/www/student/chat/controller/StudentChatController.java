package com.privateplaylist.www.student.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentChatController {
	
	@RequestMapping("/chat")
	public String StudentChat() {
		return "student/chat/chat";
	}
	
	

}
