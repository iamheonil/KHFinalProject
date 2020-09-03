package com.privateplaylist.www.student.wishlist.contoller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.wishlist.service.WishlistService;

import common.util.Paging;

@Controller
@RequestMapping("student")
public class WishlistController {

	@Autowired
	private WishlistService wishlistService;
	
	@RequestMapping("wishlist")
	public ModelAndView wishlistStu(HttpSession session, @RequestParam(required = false, defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();

		Member m = (Member) session.getAttribute("loginUser");
		int userNo = 1;
		
		Paging paging = wishlistService.getPagingWishStu(curPage, userNo);
		List<Map<String, Object>> list = wishlistService.selectWishStu(paging, userNo);
//		System.out.println(list);
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		
		mav.setViewName("student/wishlist/wishlist");
		return mav;
	}
	
	@RequestMapping("deletewish")
	@ResponseBody
	public int deleteWish(@RequestParam int wishNo) {
		
		int res = wishlistService.deleteWishlist(wishNo);
		
		return res;
	}
	
	@RequestMapping("signlesson")
	@ResponseBody
	public int signLesson(@RequestParam int lessonNo, @RequestParam int teacherNo, @RequestParam int wishNo, HttpSession session) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int userNo = 1;
		
		// 이미 신청된 내역이 있는지 확인하기
		int chk = wishlistService.checkalreadysign(lessonNo, userNo, teacherNo);
		
		if( chk == 0 ) {
			int res = wishlistService.insertConnLesson(lessonNo, userNo, teacherNo);
			if( res > 0) {
				wishlistService.deleteWishlist(wishNo);
			}
			return 1;
		}else {
			return 0;
		}
		
	}
	
	
	
	
	
}
