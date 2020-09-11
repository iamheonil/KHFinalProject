package com.privateplaylist.www.student.connectLesson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.student.connectLesson.dao.StuConnectLessonDao;

import common.util.Paging;

@Service
public class StuConnectLessonServiceImpl implements StuConnectLessonService{ 

	@Autowired
	private StuConnectLessonDao stuConnectLessonDao;

	@Override
	public Paging getPagingCntLesson(int curPage, int userNo) {
		int totalCount = stuConnectLessonDao.selectCntEndLesson(userNo);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	
	@Override
	public List<Map<String, Object>> selectEndLesson(Paging paging, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("userNo", userNo);
		
		return stuConnectLessonDao.selectEndLesson(map);
	}
	
}
