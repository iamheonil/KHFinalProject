package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Membership;

import common.util.Paging;

public interface ConnectLessonService {

	/**
	 * 과외 신청한 모든 학생
	 * @param paging 
	 * @param userNo 
	 * @return
	 */
	public List<Map<String, Object>> selectConnectStu(Paging paging, int userNo);

	/**
	 * 과외신청학생 페이징
	 * @param curPage
	 * @param userNo 
	 * @return
	 */
	public Paging getPagingCntLesson(int curPage, int userNo);

	/**
	 * 학생 신청 승인 -> 연결과외로 update
	 * @param connNo
	 * @return
	 */
	public int updateConnState(int connNo);

	/**
	 * 학생 신청 거절
	 * @param connNo
	 * @return
	 */
	public int rejectSignStu(int connNo);

	/**
	 * 최대 인원수 확인
	 * @param connNo 
	 * @return
	 */
	public Map<String, Integer> getMaxPeople(int connNo);

	/**
	 * 현재 신청한 학생 수 확인
	 * @param integer
	 * @return
	 */
	public int getConnectedCnt(int lessonNo);

	/**
	 * 과외 정보
	 * @param lessonNo
	 * @return
	 */
	public Map<String, Object> selectLessonByNo(int lessonNo);

	/**
	 * 학생 정보
	 * @param studentNo
	 * @return
	 */
	public Membership selectStudentByNo(int studentNo);

	/**
	 * 인원수가 다 찼으면 과외 게시글 내리기
	 * @param lessonNo
	 */
	public void downLessonBoard(int lessonNo);
	
	

}
