package com.privateplaylist.www.user.board.boardMain.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.dto.Admin;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.boardMain.service.BoardMainService;

@Controller
@RequestMapping("/board")
public class BoardMainController {
	
	@Autowired
	BoardMainService boardMainService;
	
	
	@RequestMapping("/main")
	public String boardMain(Model model, HttpSession session) {
		
//		System.out.println("게시판 메인");
		
		Member mem = (Member) session.getAttribute("loginUser");
		Admin admin = (Admin)session.getAttribute("loginAdmin");
		
		if(mem != null || admin != null) {//로그인이 되어있을때만 실행
			
			//공지사항
			List<Map<String, Object>> notice = boardMainService.selectNotice();
			
			//후기게시판
			List<Map<String, Object>> review = boardMainService.selectReview();
			
			//질문게시판
			List<Map<String, Object>> question = boardMainService.selectQuestion();
			
			//중고장터
			List<Map<String, Object>> market = boardMainService.selectMarket();
			
			
//			System.out.println(notice);
//			System.out.println(review);
//			System.out.println(question);
//			System.out.println(market);
			
			model.addAttribute("notice", notice);
			model.addAttribute("review", review);
			model.addAttribute("question", question);
			model.addAttribute("market", market);
			
			return "user/boardMain";
		
		} else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
			
			return "redirect:/member/login";
			
		}
		
	}

}
