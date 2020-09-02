package com.privateplaylist.www.teacher.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.teacher.board.service.TeacherReviewService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher/review")
public class TeacherReviewController {
	
	@Autowired
	private TeacherReviewService teacherReviewService;
	
	//후기게시판 정보 전체 조회
			@RequestMapping("/list")
			public String questionList(Model model,HttpServletRequest req) {
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = teacherReviewService.reviewListPaging(req);
						
				//공지사항 정보 전체 조회 list
				List<Review> reviewList = teacherReviewService.selectReviewList(paging);
				
				//모델값 전달
				model.addAttribute("reviewList", reviewList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				System.out.println(reviewList);
				
//				System.out.println(questionList);
				return "teacher/board/review/list";
		
			}
			
			
//			//검색
//			@RequestMapping(value="/search",method = RequestMethod.POST )
//			public String questionSearch(Model model,@RequestParam String keyword,HttpServletRequest req) {
//				
//				//root context
//				String root = req.getContextPath();
//				
//				//요청 파라미터를 전달하여 paging 객체 생성하기
//				Paging paging = teacherQuestionService.questionSearchPaging(req,keyword);
//				
//				//키워드와 페이징을 넣어줄 map
//				Map<String, Object> searchMap = new HashMap<String, Object>();
//				
//				searchMap.put("keyword", keyword);
//				searchMap.put("paging", paging);
//				//글 검색하기
//				List<Question> questionSearchList = teacherQuestionService.selectSearchQuestion(searchMap);
//				
//				if(keyword.equals("")) {
//					model.addAttribute("alertMsg", "검색어를 입력해주세요");
//					model.addAttribute("url", root+"/teacher/question/list");
//
//					return "/teacher/question/error";
//					
//				}
//				
//				//모델값 전달
//				model.addAttribute("keyword", keyword);
//				model.addAttribute("questionSearchList", questionSearchList);
//				
//				//페이징 결과 전달
//				model.addAttribute("paging", paging);
//				
//				
//				//검색 완료
//				return "/teacher/question/search";
//			}
}
