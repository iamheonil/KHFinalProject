package com.privateplaylist.www.student.lesson.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.lesson.service.StuApplyLessonService;

import common.util.Paging;

@Controller
@RequestMapping("/student")
public class StuApplyLessonController {

	@Autowired
	private StuApplyLessonService stuApplyLessonService;
	
	@RequestMapping(value = "/applylist", method = RequestMethod.GET)
	public ModelAndView stuApplyList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//요청 파라미터를 전달하여 paging 객체 생성하기
		Paging paging = stuApplyLessonService.getPagingStuApply(curPage, loginUser);

		List<Map<String, Object>> list = stuApplyLessonService.selectApplyList(paging, loginUser); 
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("student/lesson/signToTch");
		return mav;
	}
	
	@RequestMapping(value = "/teacherinfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> studentInfo(@RequestParam int teacherNo) {
		
		Map<String, Object> membership = stuApplyLessonService.selectTeacherByNo(teacherNo);
		return membership;
	}
	
	@RequestMapping(value = "/cancelapply", method = RequestMethod.POST)
	@ResponseBody
	public int deleteApply(@RequestParam int connLessonNo) {
		
		int deleteApply = stuApplyLessonService.cancelApplyByNo(connLessonNo);
		return deleteApply;
	}
	
	
	
}
