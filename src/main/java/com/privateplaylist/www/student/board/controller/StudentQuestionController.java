package com.privateplaylist.www.student.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.board.service.StudentQuestionService;

import common.util.Paging;

@Controller
@RequestMapping("/student")
public class StudentQuestionController {
	
	@Autowired
	private StudentQuestionService studentQuestionService;
	
	
	//질문게시판 정보 전체 조회
	@RequestMapping("/questionlist")
	public ModelAndView questionList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = studentQuestionService.getPagingStuQuestion(curPage, loginUser);
				
		//본인이 작성한 질문게시판 조회 list
		List<Question> questionList = studentQuestionService.selectQuestionList(paging, loginUser);
		
		// -------------------------------------------------------
		
		//본인이 작성한 질문게시판 댓글, 대댓글 조회
//		Paging paging2 = studentQuestionService.getPagingStuQuestionComm(curPage, loginUser);
		
//		List<QuestionComm> questionCommList = studentQuestionService.selectQuestionCommList(paging2, loginUser);
		
//		mav.addObject("Qcommlist", questionCommList);
		mav.addObject("Qlist", questionList);
		mav.addObject("paging", paging);
		mav.setViewName("student/board/questionList");
		return mav;

	}

	
	@RequestMapping("/questioncommlist")
	public ModelAndView questionCommList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//본인이 작성한 질문게시판 댓글, 대댓글 조회
		Paging paging = studentQuestionService.getPagingStuQuestionComm(curPage, loginUser);
		
		List<QuestionComm> questionCommList = studentQuestionService.selectQuestionCommList(paging, loginUser);
		System.out.println(questionCommList);
		mav.addObject("Qcommlist", questionCommList);
		mav.addObject("paging", paging);
		mav.setViewName("student/board/questionCommList");
		return mav;
		
	}

}
