package com.privateplaylist.www.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.privateplaylist.www.member.service.FindLessonService;

import common.util.Paging;

@Controller
@RequestMapping("/member")
public class FindLesson {
	
	@Autowired
	private FindLessonService fls;
	
	@RequestMapping("/findLesson")
	public String FindLessonPage(Model model,@RequestParam(defaultValue = "1")String curPage,HttpServletRequest req) {
		
		//필터링 처리하기
		String Loc=null;
		if((String) req.getParameter("Loc") != null) {
			Loc=(String) req.getParameter("Loc");
			
		}else {
			Loc="무관";
		}
		
		String Age=null;
		if((String) req.getParameter("Age") != null) {
			Age=(String) req.getParameter("Age");
		}else {
			Age="무관";
		}
		
		String Sex=null;
		if((String) req.getParameter("Sex") != null) {
			Sex=(String) req.getParameter("Sex");
		}else {
			Sex="무관";
		}
		
		String Sub=null;
		if((String) req.getParameter("Sub") != null) {
			Sub=(String) req.getParameter("Sub");
		}else {
			Sub="무관";
		}
		
		String Pri=null;
		if((String) req.getParameter("Pri") != null) {
			Pri=(String) req.getParameter("Pri");
		}else {
			Pri="무관";
		}
		
		String Cnt=null;
		if((String) req.getParameter("Cnt") != null) {
			Cnt=(String) req.getParameter("Cnt");
		}else {
			Cnt="무관";
		}
		
		
		Map<String,Object> option=new HashMap<String, Object>();
		option.put("Loc", Loc);
		option.put("Age", Age);
		option.put("Sex", Sex);
		option.put("Sub", Sub);
		option.put("Pri", Pri);
		option.put("Cnt", Cnt);
		
		int Curp=Integer.parseInt(curPage);//현채페이지
		
		Paging page=fls.getPaging(option,Curp);
		
		option.put("startNo", page.getStartNo());
		option.put("endNo", page.getEndNo());
		
		
		
		
		List<Map<String,Object>> findLessonList=fls.selectFindLessonList(option);
		List<Map<String,Object>> starAndReview= fls.selectStarAndReview();

		System.out.println(starAndReview);
		System.out.println(findLessonList);
		
		model.addAttribute("findLessonList",findLessonList);
		model.addAttribute("paging", page);
		model.addAttribute("option", option);
		model.addAttribute("star", starAndReview);
		
		
		
		
		
		return "member/FindLesson";
	}

}
