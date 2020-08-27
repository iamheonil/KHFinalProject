/**
 /* 이인주 20200821 
 *  수익 컨트롤러 
 */

package com.privateplaylist.www.admin.profit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.admin.profit.service.ProfitService;

@Controller
@RequestMapping("/admin/profit")
public class ProfitController {
	
	@Autowired
	private ProfitService profitService;
	
	//수익 페이지 list
	@RequestMapping("/list")
	public String  profitList(Model model) {
		System.out.println("/admin/profit/list");
		
//		//2020  수익금
		int profit01 = profitService.selectprofit01();
		int profit02 = profitService.selectprofit02();
		int profit03 = profitService.selectprofit03();
		int profit04 = profitService.selectprofit04();
		int profit05 = profitService.selectprofit05();
		int profit06 = profitService.selectprofit06();
		int profit07 = profitService.selectprofit07();
		int profit08 = profitService.selectprofit08();
		int profit09 = profitService.selectprofit09();
		int profit10 = profitService.selectprofit10();
		int profit11 = profitService.selectprofit11();
		int profit12 = profitService.selectprofit12();
		
		
		//월별로 
		Map<String, Object> profitMap = new HashMap<String, Object>();
		
		profitMap.put("profit01", profit01);
		profitMap.put("profit02", profit02);
		profitMap.put("profit03", profit03);
		profitMap.put("profit04", profit04);
		profitMap.put("profit05", profit05);
		profitMap.put("profit06", profit06);
		profitMap.put("profit07", profit07);
		profitMap.put("profit08", profit08);
		profitMap.put("profit09", profit09);
		profitMap.put("profit10", profit10);
		profitMap.put("profit11", profit11);
		profitMap.put("profit12", profit12);
		
		//모델값 전달
		model.addAttribute("profitMap", profitMap);
				
		//결과 리스트
		return "/admin/profit/list";
	}
	
}

