package com.privateplaylist.www.admin.lesson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.lesson.dao.LessonConfirmDao;

@Service
public class LessonConfirmServiceImpl implements LessonConfirmService {

	
	@Autowired
	LessonConfirmDao lessonConfirmDao;
	
	
	//검토할 과외 조회
	@Override
	public List<Map<String, Object>> selectConfirmLesson() {
		
		List<Map<String, Object>> confirmList = lessonConfirmDao.selectConfirmLesson();
		return confirmList;
	}

}
