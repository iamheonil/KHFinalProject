package com.privateplaylist.www.user.board.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("board")
public class userMarketController {
	
	@RequestMapping("/market")
	public ModelAndView userMarket() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/board/marketList");
		return mav;
	}

}
