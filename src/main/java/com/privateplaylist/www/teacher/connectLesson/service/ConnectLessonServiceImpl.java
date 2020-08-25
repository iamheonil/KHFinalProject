package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.teacher.connectLesson.dao.ConnectLessonDao;

import common.util.Paging;

@Service
public class ConnectLessonServiceImpl implements ConnectLessonService {
	
	@Autowired
	private ConnectLessonDao connectLessonDao;

	@Override
	public List<Map<String, Object>> selectConnectStu(Paging paging) {
		return connectLessonDao.selectConnectStu(paging);
	}

	@Override
	public Paging getPagingCntLesson(int curPage, int userNo) {
		
		int totalCount = connectLessonDao.selectCntAllStu(userNo);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

}
