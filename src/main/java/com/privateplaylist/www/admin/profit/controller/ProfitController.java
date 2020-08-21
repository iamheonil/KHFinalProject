/**
 /* 이인주 20200821 
 *  수익 컨트롤러 
 */

package com.privateplaylist.www.admin.profit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.admin.profit.service.ProfitService;

import common.util.Paging;

@Controller
@RequestMapping("/admin/profit")
public class ProfitController {
	
	@Autowired
	private ProfitService profitService;
	
	//수익 페이지 list
	@RequestMapping("/list")
	public String  profitList(Model model) {
		System.out.println("/admin/profit/list");
		
		//
//		int res = noticeService.deleteNotice(noticeNo);
		
		//
		return "/admin/profit/list";
	}
	
}

