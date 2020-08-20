package com.privateplaylist.www.admin.lesson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.lesson.dao.LessonViewDao;

@Service
public class LessonViewServiceImpl implements LessonViewService{

	@Autowired
	LessonViewDao lessonViewDao;
	
	//과외 전체 출력
	@Override
	public List<Map<String, Object>> selectLessonAll() {
		List<Map<String, Object>> lessonList = lessonViewDao.selectLessonAll();
		return lessonList;
	}

}
