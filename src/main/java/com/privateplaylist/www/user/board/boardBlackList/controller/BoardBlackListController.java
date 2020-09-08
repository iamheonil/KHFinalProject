package com.privateplaylist.www.user.board.boardBlackList.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.boardBlackList.service.BoardBlackListService;

@Controller
@RequestMapping("/board")
public class BoardBlackListController {

	
	@Autowired
	BoardBlackListService boardBlackListService;
	
	
	//게시글에서 신고버튼 눌렀을 때
	@RequestMapping("/blacklist")
	public String boardBlackList(Model model, HttpSession session, HttpServletRequest req) {
		
//		System.out.println("신고하기");
		
		 Member mem = (Member) session.getAttribute("loginUser");
	      
	      if(mem != null) {//로그인이 되어있을때만 실행
	         
	    	  
	    	  int no = Integer.parseInt(req.getParameter("no"));
	    	  String title = req.getParameter("title");
	    	  String board = req.getParameter("board");
	    	  int userNo = mem.getUserNo();
	    	  String userId = mem.getUserId();
	    	  
	    	  
	    	  model.addAttribute("no", no); //글번호
	    	  model.addAttribute("title", title); //글제목
	    	  model.addAttribute("board", board); //게시판
	    	  model.addAttribute("userNo", userNo); //신고자
	    	  model.addAttribute("userId", userId); //신고자 아이디
	    	  
	    	  
	    	  //신고 폼으로 이동
	    	  return "user/boardBlackList";
	    	  
	      
	      } else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
	         
	         return "redirect:/member/login";
	         
	      }
		
	}
	
	//신고 폼 작성한 후 신고하기 눌렀을 때
	@RequestMapping("/blacklist/insert")
	public String boardBlackListInsert(HttpSession session, HttpServletRequest req) {
		
		 Member mem = (Member) session.getAttribute("loginUser");
	      
	      if(mem != null) {//로그인이 되어있을때만 실행
	         
	    	  
//	    	  System.out.println("왓냐");
	    	  
	    	  int no = Integer.parseInt(req.getParameter("no"));
	    	  String board = req.getParameter("board");
	    	  int userNo = mem.getUserNo();
	    	  String blContent = req.getParameter("blContent");
	    	  
	    	  
	    	  Map<String, Object> map = new HashMap<>(); 
	    	  
	    	  map.put("no", no); //글번호
	    	  map.put("board", board); //게시판
	    	  map.put("userNo", userNo); //신고자
	    	  map.put("blContent", blContent); //신고내역(BlackListContent)
	    	  
	    	  
	    	  //신고 insert
	    	  int res = boardBlackListService.insertBoardBlackList(map);
	    	  
	    	  
	    	  //원래 화면으로 돌아가기
	    	  if(board.equals("후기")) { //신고들어온 게시판이 후기일때
	    		  
	    		  return "redirect:/board/review";
	    		  
	    	  } else if(board.equals("장터")) { //장터일때
	    		  
	    		  return "redirect:/board/market";
	    	  
	    	  } else { //질문일때
	    		  
	    		  return "redirect:/board/question";
	    	  }
	    		  
	    	  
	      
	      } else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
	         
	         return "redirect:/member/login";
	         
	      }
		
	}
	
	
}
