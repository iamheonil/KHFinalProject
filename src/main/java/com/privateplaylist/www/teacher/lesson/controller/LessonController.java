package com.privateplaylist.www.teacher.lesson.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.lesson.service.LessonService;

import common.exception.FileException;
import common.util.Paging;

@Controller
@RequestMapping("/teacher")
public class LessonController {
	
	@Autowired
	LessonService lessonService;
	
	@RequestMapping("/caution")
	public ModelAndView caution() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("teacher/lesson/caution");
		
		return mav;
	}
	
	
	@RequestMapping("/writelesson")
	public ModelAndView writeLesson(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");

		mav.addObject("userInfo", loginUser);
		mav.setViewName("teacher/lesson/writeLesson");
		return mav;
	}
	
	
	@RequestMapping("/insertlesson")
	public ModelAndView insertLesson(
			//여러개의 MultipartFile을 담기 위한 List 생성
			@RequestParam List<MultipartFile> files
			, HttpSession session, FindLesson findLesson, String lessonLocDetail, String dong) throws FileException {
		
		ModelAndView mav = new ModelAndView();
		
		String root = session.getServletContext().getRealPath("/");
		
		findLesson.setLessonLoc(findLesson.getLessonLoc()+","+lessonLocDetail +","+dong);

		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		findLesson.setUserNo(loginUser.getUserNo());
		
		System.out.println(findLesson);
		
		int res = lessonService.insertLesson(findLesson, files, root);
		
//		if(res >0) {
//			mav.addObject("msg", "작성 완료되었습니다. 관리자 승인은 최대 24시간 이내에 처리 완료됩니다.");
//		}else {
//			mav.addObject("msg", "작성 실패했습니다.");
//		}
		
		mav.setViewName("redirect:caution");
		
		return mav;
	}
	
	@RequestMapping("/lessonlist")
	public ModelAndView lessonList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Paging paging = lessonService.getPagingAdminStu(curPage, loginUser.getUserNo());
		System.out.println("컨트롤러 - paging : "+paging);
		List<Map<String, Object>> list = lessonService.selectLessonList(paging, loginUser);
		System.out.println("컨트롤러 - list : "+list);
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("teacher/lesson/mylessonList");
		return mav;
	}
	
	@RequestMapping("/deletelesson")
	public ModelAndView deleteLesson(int lessonNo) {
		
		ModelAndView mav = new ModelAndView();
		
		int res = lessonService.deleteLesson(lessonNo);
		mav.setViewName("redirect:lessonlist");
		return mav;
	}
	
	
	@RequestMapping("/endlesson")
	public ModelAndView endLesson(int lessonNo) {
		ModelAndView mav = new ModelAndView();
		
		lessonService.endlesson(lessonNo);
		mav.setViewName("redirect:lessonlist");
		
		return mav;
	}
	
	
	

}
