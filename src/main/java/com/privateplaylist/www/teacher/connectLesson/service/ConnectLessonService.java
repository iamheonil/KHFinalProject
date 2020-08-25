package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface ConnectLessonService {

	/**
	 * 과외 신청한 모든 학생
	 * @param paging 
	 * @return
	 */
	public List<Map<String, Object>> selectConnectStu(Paging paging);

	/**
	 * 과외신청학생 페이징
	 * @param curPage
	 * @param userNo 
	 * @return
	 */
	public Paging getPagingCntLesson(int curPage, int userNo);
	
	

}
