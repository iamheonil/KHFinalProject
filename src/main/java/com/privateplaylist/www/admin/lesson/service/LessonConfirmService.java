package com.privateplaylist.www.admin.lesson.service;

import java.util.List;
import java.util.Map;

public interface LessonConfirmService {

	//검토할 과외 조회
	List<Map<String, Object>> selectConfirmLesson();
	
	
	

}
