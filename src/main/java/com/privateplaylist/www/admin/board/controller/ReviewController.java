package com.privateplaylist.www.admin.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

//김수현 : 후기게시판 컨트롤러

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = reviewService.reviewListPaging(req);
						System.out.println(paging);
				//공지사항 정보 전체 조회 list
				List<Map<String,Object>> reviewList = reviewService.selectReviewList(paging);
				
				System.out.println(reviewList);
				//모델값 전달
				model.addAttribute("reviewList", reviewList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				
				 // 평점 옵션
			      Map<Integer, String> ratingOptions = new HashMap<>();
			      ratingOptions.put(0, "☆☆☆☆☆");
			      ratingOptions.put(1, "★☆☆☆☆");
			      ratingOptions.put(2, "★★☆☆☆");
			      ratingOptions.put(3, "★★★☆☆");
			      ratingOptions.put(4, "★★★★☆");
			      ratingOptions.put(5, "★★★★★");
			      model.addAttribute("ratingOptions", ratingOptions);
			      
				
				
				
				
				return "admin/review/list";
		
			}
	
			
			//질문게시판 글 삭제하기 (선택 삭제)
			@RequestMapping("/idxdelete")
			public String  reviewIdxDelete(Model model,HttpServletRequest req) {
				
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
	
	
			//검색
			@RequestMapping(value="/search")
			public String questionSearch(Model model,@RequestParam String keyword,HttpServletRequest req) {
				
				//root context
				String root = req.getContextPath();
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = reviewService.reviewSearchPaging(req,keyword);
				
				//키워드와 페이징을 넣어줄 map
				Map<String, Object> searchMap = new HashMap<String, Object>();
				
				searchMap.put("keyword", keyword);
				searchMap.put("paging", paging);
				//글 검색하기
				List<Map<String,Object>> reviewSearchList = reviewService.selectSearchReview(searchMap);
				
				if(keyword.equals("")) {
					model.addAttribute("alertMsg", "검색어를 입력해주세요");
					model.addAttribute("url", root+"/admin/review/list");

					return "/admin/review/error";
					
				}
				//모델값 전달
				model.addAttribute("keyword", keyword);
				model.addAttribute("reviewSearchList", reviewSearchList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				
				
				
				// 평점 옵션
			      Map<Integer, String> ratingOptions = new HashMap<>();
			      ratingOptions.put(0, "☆☆☆☆☆");
			      ratingOptions.put(1, "★☆☆☆☆");
			      ratingOptions.put(2, "★★☆☆☆");
			      ratingOptions.put(3, "★★★☆☆");
			      ratingOptions.put(4, "★★★★☆");
			      ratingOptions.put(5, "★★★★★");
			      model.addAttribute("ratingOptions", ratingOptions);
				//검색 완료
				return "/admin/review/search";
			}
			
			
			
			
			
//			 //선생님 작성 글 보기
//		    @RequestMapping("/tchdetail")
//		    public ModelAndView tchDetail(int userNo) {
//		       
//		      ModelAndView mav = new ModelAndView();
//		      Map<String, Object> commandMap = adminMemberService.selectTchAllList(userNo);
//		      
//		      Map<String, Object> info = adminMemberService.selectUserByNo(userNo);
////		      System.out.println("컨트롤러 commandMap : "+ commandMap);
////		      System.out.println("컨트롤러 commandMap : "+ commandMap.get("stuReview"));
//		      System.out.println(info);
//		      
//		      mav.addObject("tchData", commandMap);
//		      mav.addObject("teacherinfo", info);
//		      mav.setViewName("admin/member/tchDetail");
//		      
//		      // 평점 옵션
//		      Map<Integer, String> ratingOptions = new HashMap<>();
//		      ratingOptions.put(0, "☆☆☆☆☆");
//		      ratingOptions.put(1, "★☆☆☆☆");
//		      ratingOptions.put(2, "★★☆☆☆");
//		      ratingOptions.put(3, "★★★☆☆");
//		      ratingOptions.put(4, "★★★★☆");
//		      ratingOptions.put(5, "★★★★★");
//		      mav.addObject("ratingOptions", ratingOptions);
//		      
//		      return mav;
//		    }

			
	
}
