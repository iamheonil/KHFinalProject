/**
 /* 이인주 20200819 
 * 공지사항 컨트롤러 
 * 
 * 1. noticeList : 공지사항 전체 조회
 * 
 */

package com.privateplaylist.www.admin.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.admin.board.service.NoticeService;
import com.privateplaylist.www.dto.Notice;

import common.util.Paging;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 정보 전체 조회
	@RequestMapping("/list")
	public String  noticeList(Model model,HttpServletRequest req) {
//		System.out.println("/admin/notice/list");
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = noticeService.noticeListPaging(req);
				
		//공지사항 정보 전체 조회 list
		List<Notice> noticeList = noticeService.selectNoticeList(paging);
		
		//모델값 전달
		model.addAttribute("noticeList", noticeList);
		
		//페이징 결과 전달
		model.addAttribute("paging", paging);
		
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
	
	//공지사항 글쓰기 jsp 
	@RequestMapping("/write")
	public String  noticeWrite(Model model) {
//		System.out.println("/admin/notice/write");
		
		return "/admin/notice/write";
	}	
	
	//공지사항 글쓰기 insert
	@RequestMapping("/insert")
	public String  noticeInsert(Model model,@ModelAttribute Notice notice) {
//		System.out.println("/admin/notice/insert");
//		System.out.println("notice"+notice);
		
		//글쓰기 insert
		int res = noticeService.insertNotice(notice);
		
		//글쓰기 완료
		return "redirect:list";
	}
	
	//공지사항 글수정하기 jsp
	@RequestMapping("/modifyJsp")
	public String  noticeModifyJsp(Model model,@RequestParam int noticeNo) {
//		System.out.println("/admin/notice/modifyJsp");
//		System.out.println("noticeNo"+noticeNo);
		
		//글 가지고오기
		Notice noticeone = noticeService.selectNoticeone(noticeNo);
		
		//모델값 전달
		model.addAttribute("noticeone", noticeone);
		
		//수정jsp
		return "/admin/notice/modify";
	}
	
	//공지사항 글수정하기 
	@RequestMapping("/modify")
	public String  noticeModify(Model model,@RequestParam int noticeNo,@ModelAttribute Notice notice) {
//		System.out.println("/admin/notice/modify");
//		System.out.println("noticeNo"+noticeNo);
//		System.out.println("notice"+notice);
		
		notice.setNoticeNo(noticeNo);
		
		//글 수정하기
		int res = noticeService.updateNotice(notice);
		
		//수정완료
		return "redirect:list";
	}
	
	//공지사항 글 삭제하기 (상세보기 페이지에서 삭제)
	@RequestMapping("/delete")
	public String  noticeDelete(Model model,@RequestParam int noticeNo) {
//		System.out.println("/admin/notice/delete");
//		System.out.println("noticeNo"+noticeNo);
		
		//글 삭제하기
		int res = noticeService.deleteNotice(noticeNo);
		
		//삭제 완료
		return "redirect:list";
	}
	
	//공지사항 글 삭제하기 (선택 삭제)
	@RequestMapping("/chodeletecho")
	public String  noticeChoDeletecho(Model model,HttpServletRequest req) {
//		System.out.println("/admin/notice/chodeletecho");
		
		//root context
		String root = req.getContextPath();
		
		String[] checkRowArr =  req.getParameterValues("checkRow");
		
		if(checkRowArr == null) {
			model.addAttribute("alertMsg", "선택된 값이 없습니다 다시 선택해주세요");
			model.addAttribute("url", root+"/admin/notice/list");

			return "/admin/notice/error";
			
		}else {
			//체크박스 선택시 삭제 실행
			for (int i = 0; i < checkRowArr.length; i++) {
//				System.out.println(checkRowArr[i]);
				int noticeNo = Integer.parseInt(checkRowArr[i]);
				int res = noticeService.deleteNotice(noticeNo);
			}
			
			//삭제 완료
			return "redirect:list";
		}
	}
	
	//공지사항 글 제목 && 내용 키워드 검색
	@RequestMapping("/search")
	public String noticeSearch(Model model,@RequestParam String keyword,HttpServletRequest req) {
//		System.out.println("/admin/notice/search");
//		System.out.println("keyword"+keyword);
		
		//root context
		String root = req.getContextPath();
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = noticeService.noticeSearchPaging(req,keyword);
		
		//키워드와 페이징을 넣어줄 map
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("keyword", keyword);
		searchMap.put("paging", paging);
				
		//글 검색하기
		List<Notice> noticeSearchList = noticeService.selectSearchNotice(searchMap);
		
		if(keyword.equals("")) {
			model.addAttribute("alertMsg", "검색어를 입력해주세요");
			model.addAttribute("url", root+"/admin/notice/list");

			return "/admin/notice/error";
			
		}
		
		//모델값 전달
		model.addAttribute("keyword", keyword);
		model.addAttribute("noticeSearchList", noticeSearchList);
		
		//페이징 결과 전달
		model.addAttribute("paging", paging);
				
		//검색 완료
		return "/admin/notice/search";
	}
	
	
}

