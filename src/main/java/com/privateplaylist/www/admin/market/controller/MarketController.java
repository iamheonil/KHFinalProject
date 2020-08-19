package com.privateplaylist.www.admin.market.controller;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.admin.market.service.MarketService;


@Controller
public class MarketController {
	@Autowired
	MarketService marketService;
	
	@RequestMapping("/admin/market")
	public String marketMapper(Model model,@RequestParam(required = false,defaultValue = "1") int curPage) {
		
		Map<String,Object> marketMap=marketService.allMarketList(curPage);
		model.addAttribute("paging",marketMap.get("mPage"));
		model.addAttribute("marketList",marketMap);
		
		return "admin/adminMarket";
	}
	
	

}
