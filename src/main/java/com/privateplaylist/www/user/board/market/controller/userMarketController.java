package com.privateplaylist.www.user.board.market.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.user.board.market.service.UserMarketService;

@Controller
@RequestMapping("board")
public class userMarketController {
	
	@Autowired
	private UserMarketService userMarketService;
	
	@RequestMapping("/market")
	public ModelAndView userMarket() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/market/marketList");
		return mav;
	}

	@RequestMapping("/market/detail")
	public ModelAndView marketDetail(HttpSession session, @RequestParam int mkno) {
		ModelAndView mav = new ModelAndView();
		
		Member m = (Member) session.getAttribute("loginUser");

		// 게시글 정보
		Market market  = userMarketService.getMarketInfo(mkno);
//		System.out.println(market);
		
		// 로그인한 유저가 작성자인지 확인
		boolean userChk = userMarketService.compareUserWriter();
		
		mav.addObject("market", market);
		mav.setViewName("user/market/marketDetail");
		return mav;
	}
	
	

}
