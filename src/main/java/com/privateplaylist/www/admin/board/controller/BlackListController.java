package com.privateplaylist.www.admin.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.admin.board.service.BlackListService;

import common.util.Paging;

@Controller
@RequestMapping("/admin")
public class BlackListController {
	
	@Autowired
	private BlackListService blackListService;
	
	@RequestMapping("/blacklist")
	public ModelAndView blackList(@RequestParam(required = false, defaultValue = "1") int curPage, @RequestParam(required = false, defaultValue="전체") String category, @RequestParam(required = false, defaultValue="") String search) {
		
		ModelAndView mav = new ModelAndView();
		
		// 페이징 처리위한 객체
		Paging paging = blackListService.getPagingBlack(curPage, category ,search);
		
		List<Map<String, Object>> list = blackListService.selectAllBlackList(paging, category);
		
		int blackCnt = blackListService.selectReportCnt();
		
		mav.addObject("search", search);
		mav.addObject("category", category);
		mav.addObject("blackCnt", blackCnt);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("admin/blackList/blackList");
		
		return mav;
	}
	

	@RequestMapping("/blacklist/turndown")
	@ResponseBody
	public String turndown(@RequestParam(value="mList[]", required = false) List<Integer> qList, @RequestParam(value="mList[]", required = false) List<Integer> mList, @RequestParam(value="rList[]", required = false) List<Integer> rList) {
		
//		System.out.println(rList);
//		System.out.println(mList);
		
		if( rList == null && mList == null && qList == null) {
			return "0";
		}else if(rList != null ) {
			blackListService.turndownReview(rList);
		}else if(mList != null) {
			blackListService.turndownMarket(mList);
		}else if(qList != null) {
			blackListService.turndownQuestion(qList);
		}
		
		return "1";
	}

	@RequestMapping("/blacklist/deletereview")
	@ResponseBody
	public String deleteReview(@RequestParam(value="mList[]", required = false) List<Integer> qList, @RequestParam(value="mList[]", required = false) List<Integer> mList, @RequestParam(value="rList[]", required = false) List<Integer> rList) {
		
		if( rList == null && mList == null && qList == null) {
			return "0";
		}else if(rList != null ) {
			blackListService.deleteReview(rList);
		}else if(mList != null) {
			blackListService.deleteMarket(mList);
		}else if(qList != null) {
			blackListService.deleteQuestion(qList);
		}
		return "1";
		
	}
	
	@RequestMapping("/blacklist/review/detail")
	public ModelAndView blackListReview(@RequestParam(required = false, defaultValue = "1") int no) {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = blackListService.getReviewByNo(no);
		
		 // 평점 옵션
		if(Integer.parseInt(String.valueOf(map.get("STAR_POINT"))) == 0) {
			mav.addObject("ratingOptions", "☆☆☆☆☆");
		}else if(Integer.parseInt(String.valueOf(map.get("STAR_POINT"))) == 1) {
			mav.addObject("ratingOptions", "★☆☆☆☆");
		}else if(Integer.parseInt(String.valueOf(map.get("STAR_POINT"))) == 2) {
			mav.addObject("ratingOptions", "★★☆☆☆");
			
		}else if(Integer.parseInt(String.valueOf(map.get("STAR_POINT"))) == 3) {
			mav.addObject("ratingOptions", "★★★☆☆");
			
		}else if(Integer.parseInt(String.valueOf(map.get("STAR_POINT"))) == 4) {
			mav.addObject("ratingOptions", "★★★★☆");
			
		}else if(Integer.parseInt(String.valueOf(map.get("STAR_POINT"))) == 5) {
			mav.addObject("ratingOptions", "★★★★★");
			
		}
		
		mav.addObject("r", map);
		mav.setViewName("admin/blackList/reviewDetail");
		
		return mav;
	}

}