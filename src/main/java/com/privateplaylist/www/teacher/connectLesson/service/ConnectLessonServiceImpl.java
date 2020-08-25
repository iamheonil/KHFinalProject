package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.teacher.connectLesson.dao.ConnectLessonDao;

@Service
public class ConnectLessonServiceImpl implements ConnectLessonService {
	
	@Autowired
	private ConnectLessonDao connectLessonDao;

	@Override
	public List<Map<String, Object>> selectConnectStu() {
		return connectLessonDao.selectConnectStu();
	}

}
