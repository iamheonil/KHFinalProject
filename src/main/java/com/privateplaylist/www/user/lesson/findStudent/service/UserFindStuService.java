package com.privateplaylist.www.user.lesson.findStudent.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.util.Paging;

//20200904 이인주 : user > find_student > service

public interface UserFindStuService {

	//검색 전 페이징
	public Paging userFindStuListPaging(HttpServletRequest req);

	//검색전 전체 리스트
	public List<Map<String, Object>> userFindStuList(Paging paging);

	//상세페이지
	public Map<String, Object> detailFindStu(int findStuNo);

}
