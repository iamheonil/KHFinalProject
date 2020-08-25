package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

public interface ConnectLessonService {

	/**
	 * 과외 신청한 모든 학생
	 * @return
	 */
	public List<Map<String, Object>> selectConnectStu();
	
	

}
