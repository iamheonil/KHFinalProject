package com.privateplaylist.www.teacher.connectLesson.controller;

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

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.teacher.connectLesson.service.ConnectLessonService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher")
public class ConnectLessonController {
	
	@Autowired
	private ConnectLessonService connectLessonService;
	
	@RequestMapping(value = "/signstu", method = RequestMethod.GET)
	public ModelAndView signStudent(HttpSession session, @RequestParam(required = false, defaultValue = "1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
//		Membership m = (Member) session.getAttribute("loginUser");
		
		int userNo = 10;
		
		Paging paging = connectLessonService.getPagingCntLesson(curPage, userNo);
		
		List<Map<String, Object>> list = connectLessonService.selectConnectStu(paging, userNo);
		
//		System.out.println(list);
		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("teacher/connectedLesson/signStudent");
		
		return mav;
	}

	@RequestMapping(value = "/signstu", method = RequestMethod.POST)
	@ResponseBody
	public int signStudent(@RequestParam int connNo) {
		
		// 신청온 과외의 최대 인원수 확인
		Map<String, Integer> map = connectLessonService.getMaxPeople(connNo);
		
		int lessonNo = Integer.parseInt(String.valueOf(map.get("LESSON_NO")));
		int maxPeople = Integer.parseInt(String.valueOf(map.get("MAX_PEOPLE")));
		
		// 현재 연결된 학생 수 확인
		int signCnt = connectLessonService.getConnectedCnt(lessonNo);
		
		// 인원 수 초과면 승인 불가
		if( maxPeople <= signCnt) {
			return 2;
		}
		
		// 인원 수 차지 않았으면 승인 가능
		int res = connectLessonService.updateConnState(connNo);
		//	인원수를 다 채웠을 경우 해당 과외 게시글 내리기
		
		return res;
		
		
	}

	@RequestMapping(value = "/rejectstu", method = RequestMethod.POST)
	@ResponseBody
	public int rejectStudent(@RequestParam int connNo) {
		int res = connectLessonService.rejectSignStu(connNo);
		return res;
	}

	@RequestMapping(value = "/lessoninfo", method = RequestMethod.POST)
	@ResponseBody
	public FindLesson lessonInfo(@RequestParam int lessonNo) {
		
		FindLesson findLesson = connectLessonService.selectLessonByNo(lessonNo);
		
		return findLesson;
	}

	@RequestMapping(value = "/studentinfo", method = RequestMethod.POST)
	@ResponseBody
	public Membership studentInfo(@RequestParam int studentNo) {
		
		Membership membership = connectLessonService.selectStudentByNo(studentNo);
		
		return membership;
	}

}
