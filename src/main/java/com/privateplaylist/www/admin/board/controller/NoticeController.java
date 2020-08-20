/**
 /* 이인주 20200819 
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
import org.springframework.web.bind.annotation.RequestParam;

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
//		System.out.println("/admin/notice/list");
		
		//공지사항 정보 전체 조회 list
		List<Notice> noticeList = noticeService.selectNoticeList();
		
		//모델값 전달
		model.addAttribute("noticeList", noticeList);
		
//		System.out.println(noticeList);
		
		return "admin/notice/list";
	}	
	
	//공지사항 세부정보 보기
	@RequestMapping("/detail")
	public String  noticeDetail(Model model,@RequestParam int noticeNo ) {
//		System.out.println("/admin/notice/detail");
//		System.out.println("noticeNo"+noticeNo);
		
		//공지사항 정보 조회 one
		Notice noticeone = noticeService.selectNoticeone(noticeNo);
		
		//모델값 전달
		model.addAttribute("noticeone", noticeone);
		
//		System.out.println(noticeone);
		
		return "/admin/notice/detail";
	}	
	
	//공지사항 세부정보 보기
	@RequestMapping("/write")
	public String  noticeWrite(Model model) {
		System.out.println("/admin/notice/write");
		
		return "/admin/notice/write";
	}	

}

