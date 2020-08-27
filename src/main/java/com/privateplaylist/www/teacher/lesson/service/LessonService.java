package com.privateplaylist.www.teacher.lesson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.lesson.dao.LessonDao;

import common.util.Paging;

@Service
public class LessonService {
	
	@Autowired
	LessonDao lessonDao;
	
	/*
	 * 과외 등록 폼 작성한거 DB에 저장
	 */
	public int insertLesson(FindLesson findLesson, Member loginUser) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("login", loginUser);
		map.put("findLesson", findLesson);
		
		int result = lessonDao.insertLesson(map);
		
		return result;
	}

	public Paging getPagingAdminStu(int curPage, int userNo) {
		
		int totalCount = lessonDao.getLessonListCnt(userNo);
		
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	public List<Map<String, Object>> selectLessonList(Paging paging, Member loginUser) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("paging", paging);
		map.put("loginUser", loginUser);
		
		List<Map<String, Object>> list = lessonDao.selectLessonList(map);
		
//		for( Map<String, Object> map : list) {
//			map.put("", map)
//		}
		
		return list;
	}

	public int deleteLesson(int lessonNo) {
		int res = lessonDao.deleteLesson(lessonNo);
		return res;
	}

	public void endlesson(int lessonNo) {
		
		lessonDao.endLesson(lessonNo);
		
	}



}
