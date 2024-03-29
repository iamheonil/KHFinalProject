package com.privateplaylist.www.user.lesson.findStudent.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.util.Paging12;

//20200904 이인주 : user > find_student > service

public interface UserFindStuService {

	//페이징
	public Paging12 userFindStuListPaging(HttpServletRequest req);

	//전체 리스트
	public List<Map<String, Object>> userFindStuList(Paging12 paging);

	//상세페이지
	public Map<String, Object> detailFindStu(int findStuNo);

	//검색 페이징
	public Paging12 searchPaging(Map<Object, Object> pagingParam, HttpServletRequest req);

	//검색 결과
	public List<Map<String, Object>> SearchFindStu(Map<Object, Object> searchParam);
}