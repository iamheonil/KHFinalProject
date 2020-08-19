/**
 * 이인주 20200819 
 * 공지사항 컨트롤러 
 * 
 * 1. noticeList : 공지사항 전체 조회
 * 
 */

package com.privateplaylist.www.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.board.service.NoticeService;
import com.privateplaylist.www.dto.Notice;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 정보 전체 조회
	@RequestMapping("/list")
	public String  noticeList(Model model) {
		System.out.println("/admin/notice/list");
		
		//공지사항 정보 전체 조회 list
		List<Notice> noticeList = noticeService.selectNoticeList();
		
		//모델값 전달
		model.addAttribute("noticeList", noticeList);
		
		System.out.println(noticeList);
		
		return "admin/notice/list";
	}	

}
