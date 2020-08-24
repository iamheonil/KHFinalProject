package com.privateplaylist.www.admin.member.service;

import java.util.Map;

import common.util.Paging;

public interface AdminMemberService {

	public Map<String, Object> selectStuList(Paging paging);

	/*
	 * 학생 목록 페이징
	 */
	public Paging getPagingAdminStu(int curPage, String search);
	
	public Map<String, Object> selectStuDetail(int userNo);

	public Map<String, Object> selectAllList(int userNo);

	public Paging getPagingAdminTch(int curPage, String search);

	public Map<String, Object> selectTchList(Paging paging);

//	public Map<String, Object> selectAllList(int userNo);
	

}
