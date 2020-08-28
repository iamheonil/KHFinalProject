package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.teacher.connectLesson.dao.ConnectLessonDao;

import common.util.Paging;

@Service
public class ConnectLessonServiceImpl implements ConnectLessonService {
	
	@Autowired
	private ConnectLessonDao connectLessonDao;

	@Override
	public List<Map<String, Object>> selectConnectStu(Paging paging, int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("userNo", userNo);
		
		return connectLessonDao.selectConnectStu(map);
	}

	@Override
	public Paging getPagingCntLesson(int curPage, int userNo) {
		
		int totalCount = connectLessonDao.selectCntAllStu(userNo);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public int updateConnState(int connNo) {
		return connectLessonDao.updateConnState(connNo);
	}

	@Override
	public int rejectSignStu(int connNo) {
		return connectLessonDao.rejectSignStu(connNo);
	}

	@Override
	public Map<String, Integer> getMaxPeople(int connNo) {
		return connectLessonDao.getMaxPeople(connNo);
	}

	@Override
	public int getConnectedCnt(int lessonNo) {
		return connectLessonDao.getConnectedCnt(lessonNo);
	}

	@Override
	public FindLesson selectLessonByNo(int lessonNo) {
		return connectLessonDao.selectLessonByNo(lessonNo);
	}

	@Override
	public Membership selectStudentByNo(int studentNo) {
		return connectLessonDao.selectStudentByNo(studentNo);
	}

}
