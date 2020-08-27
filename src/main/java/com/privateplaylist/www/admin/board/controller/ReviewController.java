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
				
				System.out.println("list:"+reviewList);
				//모델값 전달
				model.addAttribute("reviewList", reviewList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				
				System.out.println(reviewList);
				return "admin/review/list";
		
			}
	
			
			//질문게시판 글 삭제하기 (선택 삭제)
			@RequestMapping("/idxdelete")
			public String  reviewIdxDelete(Model model,HttpServletRequest req) {
				System.out.println("/admin/review/idxdelete");
				
				//root context
				String root = req.getContextPath();
				
				String[] checkRowArr =  req.getParameterValues("checkRow");
				
				if(checkRowArr == null) {
					model.addAttribute("alertMsg", "선택된 값이 없습니다 다시 선택해주세요");
					model.addAttribute("url", root+"/admin/review/list");

					return "/admin/review/error";
					
				}else {
					//체크박스 선택시 삭제 실행
					for (int i = 0; i < checkRowArr.length; i++) {
//						System.out.println(checkRowArr[i]);
						int reviewNo = Integer.parseInt(checkRowArr[i]);
						int res = reviewService.deleteReview(reviewNo);
					}
					
					//삭제 완료
					return "redirect:list";
				}
			}
	
	
	
}
