package com.privateplaylist.www.teacher.lesson.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		Map<String, String> file = lessonService.selectTchFile(loginUser.getUserNo());
		System.out.println(file);
		mav.addObject("file", file);
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
	
//	@RequestMapping(value = "/lessonlist", method = RequestMethod.GET)
	@RequestMapping("/lessonlist")
	public ModelAndView lessonList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Paging paging = lessonService.getPagingTchLesson(curPage, loginUser.getUserNo());
		List<Map<String, Object>> list = lessonService.selectLessonList(paging, loginUser);
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("teacher/lesson/mylessonList");
		return mav;
	}
	
//	@RequestMapping("/deletelesson")
//	public ModelAndView deleteLesson(@RequestParam int lessonNo) {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("컨트롤러 deletelesson");
//		System.out.println("lessonNo : " + lessonNo);
//		lessonService.deleteLesson(lessonNo);
//		
//		System.out.println("deleteLesson컨트롤러 실행됨");
//		mav.setViewName("redirect: lessonlist");
//		
//		return mav;
//	}

	@RequestMapping(value = "/deletelesson", method = RequestMethod.POST)
	@ResponseBody
	public int deleteLesson(@RequestParam int lessonNo) {
		int res = lessonService.deleteLesson(lessonNo);
		if(res>0) {//삭제처리에성공
			return 1;
		}else {//삭제에 실패했을때
			return 0;
		}
			
	}
	
	
	@RequestMapping("/endlesson")
	public ModelAndView endLesson(int lessonNo) {
		ModelAndView mav = new ModelAndView();
		
		lessonService.endlesson(lessonNo);
		mav.setViewName("redirect:lessonlist");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/mylessoninfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lessonInfo(@RequestParam int lessonNo) {
		
		Map<String, Object> info = lessonService.selectLessonByNo(lessonNo);
		
		return info;
	}
	
	
	//결제할 목록
	@RequestMapping("/paymentlist")
	public ModelAndView paymentList(@RequestParam(required=false, defaultValue="1") int curPage, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Paging paging = lessonService.getPagingPay(curPage, loginUser.getUserNo());
		List<Map<String, Object>> list = lessonService.selectPayList(paging, loginUser);
		
//		for (Map<String, Object> map : list) {
//
//			try {
//				System.out.println(map);
//				
//				String date = map.get("LESSON_DATE").toString();
//				String[] dateArr = date.split("-");
//				String dateString = "";
//				
//				for (int i = 0; i < dateArr.length; i++) {
//					dateString += dateArr[i];
//				}
//				System.out.println(dateString);
//				
//				SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
//				Date to = fm.parse(dateString);
//				
//				map.put("date", to);
//				
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//		}
		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("teacher/lesson/paymentList");
		return mav;
	}
	
	
	@RequestMapping("/paycheck")
	public ModelAndView payCheck(HttpSession session, int lessonNo) {
		
		ModelAndView mav = new ModelAndView();
		
		//세션값 가지고 오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		Map<String, Object> info = lessonService.selectLessonByNo(lessonNo);
		
		mav.addObject("lesson", info);
		mav.addObject("user", loginUser);
		mav.setViewName("teacher/lesson/payCheck");
		
		return mav;
	}
	
	@RequestMapping("/paycomplete")
	public ModelAndView payComplete(HttpSession session, int lessonNo) {
		
		ModelAndView mav = new ModelAndView();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
	   
	   //classbooking에 넣기
	   lessonService.insertPayment(lessonNo, loginUser);

	   lessonService.updatePayState(lessonNo);
		
		mav.setViewName("teacher/lesson/paymentList");
		return mav;
	}

}
