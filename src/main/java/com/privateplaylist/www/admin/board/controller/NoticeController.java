package com.privateplaylist.www.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.board.service.NoticeService;
import com.privateplaylist.www.dto.Notice;

@Controller
@RequestMapping("/admin")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/noticeList")
	public String  noticeList(Model model) {
		System.out.println("/admin/noticeList");
		
		//공지사항 정보 전체 조회
		List<Notice> noticeList = noticeService.selectnoticeList();
		
		//모델값 전달
		model.addAttribute("noticeList", noticeList);
		
		System.out.println(noticeList);
		
		return "/admin/noticeList";
	}	

}
