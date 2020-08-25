package com.privateplaylist.www.admin.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

//김수현 : 후기게시판 컨트롤러

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.board.service.ReviewService;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Controller
@RequestMapping("/admin/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//후기 정보 전체 조회
			@RequestMapping("/list")
			public String  noticeList(Model model,HttpServletRequest req) {
				System.out.println("/admin/review/list");
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = reviewService.reviewListPaging(req);
						
				//공지사항 정보 전체 조회 list
				List<Review> reviewList = reviewService.selectReviewList(paging);
				
				//모델값 전달
				model.addAttribute("reviewList", reviewList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				
				System.out.println(reviewList);
				return "admin/review/list";
		
			}
	
	
	
	
}
