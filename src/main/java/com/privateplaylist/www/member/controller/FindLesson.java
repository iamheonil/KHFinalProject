package com.privateplaylist.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class FindLesson {
	
	@RequestMapping("/findLesson")
	public String FindLessonPage() {
		return "member/FindLesson";
	}

}
