package com.privateplaylist.www.user.board.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.review.service.UserReviewService;

import common.util.PagingReview;

@Controller
@RequestMapping("/board")
public class UserReviewController {

	
	@Autowired
	UserReviewService userReviewService;
	
	
	@RequestMapping("/review")
	public String reviewList(Model model, HttpSession session, @RequestParam(required=false, defaultValue="1") int curPage) {
		
//		System.out.println("리뷰목록");
		
		Member mem = (Member) session.getAttribute("loginUser");
		
		
		if(mem != null) {//로그인이 되어있을때만 함수 처리
			
			int userNo = mem.getUserNo();
			
			//페이징
			PagingReview paging = userReviewService.reviewPaging(curPage);
			
			//리뷰 목록
			List<Map<String, Object>> review = userReviewService.selectReviewList(paging);
					
			//수강한 과외 목록 - 후기 쓸 수 있는 목록
			List<Map<String, Object>> lesson = userReviewService.selectLessonList(userNo);
			
			
			model.addAttribute("review", review);
			model.addAttribute("lesson", lesson);
			model.addAttribute("paging", paging);
			model.addAttribute("session", mem);
			
//			System.out.println(review);
			
			return "user/review/reviewlist";
			
			
		}  else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
			
			return "redirect:/member/login";
			
		}
		
	}
	
	
	
	@RequestMapping("/review/insert")
	public String reviewInsert(Model model, HttpSession session, HttpServletRequest req) {
		
//		System.out.println("리뷰등록 왔나");
		
		Member mem = (Member) session.getAttribute("loginUser");
		
		
		if(mem != null && mem.getUserActor() == 2) {//로그인이 되어있을때만 함수 처리
		
			
			int connLessonNo = Integer.parseInt(req.getParameter("lessonList"));
			int star = Integer.parseInt(req.getParameter("modal-star"));
			int userNo = mem.getUserNo();
			String content = req.getParameter("modal-desc");
			
			Review review = new Review();
			
			review.setConnLessonNo(connLessonNo);
			review.setUserNo(userNo);
			review.setStarPoint(star);
			review.setReviewContent(content);
			
	//		System.out.println(review);
			
			//후기 등록
			int res = userReviewService.insertReview(review);
			
	//		System.out.println("후기등록완료");
			
			//후기 등록 잘 됐으면 review_reg(후기작성여부) 업데이트
			if( res > 0 ) {
				
				int r = userReviewService.updateReviewReg(connLessonNo);
				
				return "redirect:/board/review";
			
			} else {
				
				model.addAttribute("alertMsg", "리뷰 등록에 실패하였습니다");
				model.addAttribute("url", req.getContextPath()+"/board/review");
				
				return "/admin/notice/error";
			}
			
		
		}  else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
					
			return "redirect:/member/login";
		}
		
	}
	
	
	
	@RequestMapping("/review/search")
	public String reviewInsert(Model model, HttpSession session, HttpServletRequest req, @RequestParam(required=false, defaultValue="1") int curPage, @RequestParam String keyword) {
		
		
//		System.out.println("검색 키워드:"+keyword);
		
		Member mem = (Member) session.getAttribute("loginUser");
		
		if(mem != null) { //로그인이 되어있을때만 함수 처리
			
			
			int userNo = mem.getUserNo();
		
		
			//검색어가 없을 때
			if(keyword.equals("")) {
				
				model.addAttribute("alertMsg", "검색어를 입력해주세요");
				model.addAttribute("url", req.getContextPath()+"/board/review");
				
				return "/admin/notice/error";
			}
			
			
			//후기 검색 수 조회 - 페이징
			PagingReview paging = userReviewService.reviewSearchPaging(keyword, curPage);
			
			
			//키워드, 페이징 넣어줄 map
			Map<String, Object> searchMap = new HashMap<String, Object>();
			
			searchMap.put("keyword", keyword);
			searchMap.put("paging", paging);
			
			//검색된 후기 목록
			List<Map<String, Object>> reviewSearchList = userReviewService.selectReviewSearch(searchMap);
			
			//수강한 과외 목록 - 후기 쓸 수 있는 목록
			List<Map<String, Object>> lesson = userReviewService.selectLessonList(userNo);
			
			
			model.addAttribute("review", reviewSearchList);
			model.addAttribute("lesson", lesson);
			model.addAttribute("paging", paging);
			model.addAttribute("session", mem);
			model.addAttribute("keyword", keyword);
			
			
			return "user/review/reviewSearch"; 
			
			
		} else { //로그인이 되어있지 않으면 메인페이지로 리다이렉트
					
			return "redirect:/member/login";
		}
		
	}
	
	
	
	
	
}
