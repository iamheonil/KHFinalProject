package com.privateplaylist.www.student.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.board.service.StudentReviewService;

import common.util.Paging;

@Controller
@RequestMapping("/student")
public class StudentReviewController {

	@Autowired
	private StudentReviewService studentReviewService;
	
	//후기게시판 정보 전체 조회
		@RequestMapping("/reviewlist")
		public ModelAndView questionList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
			
			ModelAndView mav = new ModelAndView();
			
			//세션값 가지고 오기
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			//요청 파라미터를 전달하여 paging 객체 생성하기
			Paging paging = studentReviewService.getPagingStuReview(curPage, loginUser);
					
			//본인이 작성한 후기 조회 list
			List<Review> reviewList = studentReviewService.selectReviewList(paging, loginUser);
			
			// -------------------------------------------------------
			mav.addObject("reviewList", reviewList);
			mav.addObject("paging", paging);
			mav.setViewName("student/board/reviewList");
			return mav;

		}
	
	
}
