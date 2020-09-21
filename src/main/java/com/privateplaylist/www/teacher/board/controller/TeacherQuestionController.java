package com.privateplaylist.www.teacher.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.board.service.TeacherQuestionService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher/question")
public class TeacherQuestionController {

	@Autowired
	private TeacherQuestionService teacherQuestionService;
	
	//질문게시판 정보 전체 조회
		@RequestMapping("/list")
		public ModelAndView questionList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
			
			ModelAndView mav = new ModelAndView();
			
			//세션값 가지고 오기
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			//요청 파라미터를 전달하여 paging 객체 생성하기
			Paging paging = teacherQuestionService.getPagingTeaQuestion(curPage, loginUser);
					
			//본인이 작성한 질문게시판 조회 list
			List<Question> questionList = teacherQuestionService.selectQuestionList(paging, loginUser);
			
			// -------------------------------------------------------
			
			//본인이 작성한 질문게시판 댓글, 대댓글 조회
//			Paging paging2 = studentQuestionService.getPagingStuQuestionComm(curPage, loginUser);
			
//			List<QuestionComm> questionCommList = studentQuestionService.selectQuestionCommList(paging2, loginUser);
			
//			mav.addObject("Qcommlist", questionCommList);
			mav.addObject("Qlist", questionList);
			mav.addObject("paging", paging);
			mav.setViewName("teacher/board/question/list");
			return mav;

		}
			
			
//			
			
			@RequestMapping("/commlist")
			public ModelAndView questionCommList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
				
				ModelAndView mav = new ModelAndView();
				
				//세션값 가지고 오기
				Member loginUser = (Member) session.getAttribute("loginUser");
				
				//본인이 작성한 질문게시판 댓글, 대댓글 조회
				Paging paging = teacherQuestionService.getPagingTeaQuestionComm(curPage, loginUser);
				
				List<QuestionComm> questionCommList = teacherQuestionService.selectQuestionCommList(paging, loginUser);
				mav.addObject("Qcommlist", questionCommList);
				mav.addObject("paging", paging);
				mav.setViewName("teacher/board/question/commList");
				return mav;
				
			}
			
			
			
			
			
			
			
			
			
			
			
}
