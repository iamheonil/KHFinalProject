package com.privateplaylist.www.admin.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {
	
	@RequestMapping("/admin/market")
	public String MarketMapper() {
		
		return "admin/adminMarket";
	}

}
