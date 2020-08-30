package com.privateplaylist.www.teacher.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.teacher.board.service.TeacherQuestionService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher/question")
public class TeacherQuestionController {

	@Autowired
	private TeacherQuestionService teacherQuestionService;
	
	//질문게시판 정보 전체 조회
			@RequestMapping("/list")
			public String questionList(Model model,HttpServletRequest req) {
				System.out.println("/admin/question/list");
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = teacherQuestionService.questionListPaging(req);
						
				//공지사항 정보 전체 조회 list
				List<Question> questionList = teacherQuestionService.selectQuestionList(paging);
				
				//모델값 전달
				model.addAttribute("questionList", questionList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				System.out.println(questionList);
				
//				System.out.println(questionList);
				return "teacher/board/question/list";
		
			}
	
	
}
