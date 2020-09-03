package com.privateplaylist.www.student.findStu.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.FindStudent;

import common.util.Paging;

public interface FindStuService {

	//학생 찾기 list 
	public List<FindStudent> findStuList(Map<Object, Object> findStuMap);

	//전체 리스트 페이징
	public Paging findStuListPaging(HttpServletRequest req, int userNo);

	//검색 페이징
	public Paging findStuSearchPaging(Map<Object, Object> findStuPagingMap);

	//학생 검색 list
	public List<FindStudent> findStuSearch(Map<Object, Object> findStuSearchMap);

	//check box 삭제
	public int deleteFindStu(int findStuNo);

	//글쓰기
	public int insertFindStu(FindStudent findStudent);

	//글 상태 변경
	public int updateState(FindStudent findStudent);

}
