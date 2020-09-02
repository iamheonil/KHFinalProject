package com.privateplaylist.www.student.blackList.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.blackList.service.StudentBlackListService;

import common.util.Paging;

@Controller
@RequestMapping("/student")
public class StudentBlackListController {
	
	
	@Autowired
	StudentBlackListService studentBlackListService;
	
	
	
	@RequestMapping("/blacklist")
	public ModelAndView studentBlacklist(HttpSession session,
										@RequestParam(required = false, defaultValue = "1") int curPage, 
										@RequestParam(required = false, defaultValue="전체") String category, 
										@RequestParam(required = false, defaultValue="") String search) {
		
		
		ModelAndView mav = new ModelAndView();
		
		Member mem=(Member) session.getAttribute("loginUser");
		
		if(mem != null) {//로그인이 되어있을때만 함수 처리
			
			String userNo = mem.getUserNo()+"";
			
			// 페이징 처리 위한 객체
			Paging paging = studentBlackListService.getPagingBlack(curPage, category ,userNo);
			
			List<Map<String, Object>> list = studentBlackListService.selectAllBlackList(paging, category);
			
			int blackCnt = studentBlackListService.selectCnt(userNo);
			
			mav.addObject("search", userNo);
			mav.addObject("category", category);
			mav.addObject("blackCnt", blackCnt);
			mav.addObject("list", list);
			mav.addObject("paging", paging);
			
			mav.setViewName("student/blackList/blackList");
			
			return mav;
		
		} else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
			
			mav.setViewName("redirect:/member/login");
			
			return mav;
		}
		
	}
		

}
