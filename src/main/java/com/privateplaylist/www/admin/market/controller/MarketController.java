package com.privateplaylist.www.admin.market.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.privateplaylist.www.admin.market.service.MarketService;


@Controller
public class MarketController {
	@Autowired
	MarketService marketService;
	
	//중고장터 리스트 & 페이징 처리 & 검색처리 하는중
	@RequestMapping("/admin/market")
	public String marketMapper(Model model,@RequestParam(required = false,defaultValue = "1") int curPage,HttpServletRequest req) {
		
		String option=(String) req.getParameter("option");
		String search=(String) req.getParameter("search");
		
		if(option==null) {//nullpointexception 방지를위한 처리
			option="";
		}
		
		model.addAttribute("option",option);//페이징을 위한 컨텍스트 추가
		model.addAttribute("search",search);

		
		Map<String,Object> marketMap=marketService.allMarketList(curPage,option,search);
		model.addAttribute("paging",marketMap.get("mPage"));
		model.addAttribute("marketList",marketMap);
		
		return "admin/adminMarket";
	}
	
	
	
	
	//중고장터 삭제 ajax
	@PostMapping("/delete/market")
	@ResponseBody
	public String deleteMarket(@RequestParam int mkNo) {
		
		
		int res=marketService.deleteMarket(mkNo);
		if(res>0) {//삭제처리에 실패했을때
			return "0";
		}else {//삭제에 성공했을때
			return "1";
		}
		
	}
	
	

}
