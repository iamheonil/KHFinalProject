package com.privateplaylist.www.admin.lesson.service;

import java.util.List;
import java.util.Map;


public interface LessonConfirmService {

	//검토할 과외 조회
	List<Map<String, Object>> selectConfirmLesson();

	
	//과외 상세 조회
	Map<String, Object> selectLessonDetail(int no);


	//과외 승인
	int updateLessonStateAdmit(int no);

	
	//과외 반려
	int updateLessonStateDeny(int no);


	

}
