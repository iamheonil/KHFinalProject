package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.teacher.connectLesson.dao.WebShareDao;

@Service
public class WebShareServiceImpl implements WebShareService {

	
	@Autowired
	WebShareDao webShareDao;
	
	
	//연결된 과외 조회
	@Override
	public List<Map<String, Object>> selectConnectedLesson(int teaNo) {
		
		return webShareDao.selectConnectedLesson(teaNo);
	}

}
