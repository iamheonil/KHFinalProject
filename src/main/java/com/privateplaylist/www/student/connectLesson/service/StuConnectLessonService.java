package com.privateplaylist.www.student.connectLesson.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface StuConnectLessonService {

	//페이징처리
	public Paging getPagingCntLesson(int curPage, int userNo);

	//수강완료 리스트 가져오기
	public List<Map<String, Object>> selectEndLesson(Paging paging, int userNo);

}
