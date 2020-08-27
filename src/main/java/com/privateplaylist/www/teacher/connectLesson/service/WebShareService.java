package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

public interface WebShareService {

	//연결된 과외 조회
	public List<Map<String, Object>> selectConnectedLesson(int teaNo);

}
