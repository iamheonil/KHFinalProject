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
		
		return lessonConfirmDao.selectConfirmLesson();
	}
	

	//과외 상세 조회
	@Override
	public Map<String, Object> selectLessonDetail(int no) {
		
		return lessonConfirmDao.selectLessonDetail(no);
	}


	//과외 승인
	@Override
	public int updateLessonStateAdmit(int no) {

		return lessonConfirmDao.updateLessonStateAdmit(no);
	}


	@Override
	public int updateLessonStateDeny(int no) {
		
		return lessonConfirmDao.updateLessonStateDeny(no);
	}

}
