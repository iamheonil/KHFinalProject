package com.privateplaylist.www.admin.member.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface AdminMemberService {
	/*
	 * 회원(학생) 전체 조회
	 */
	public List<Map<String, Object>> selectStuList(Paging paging, String category);

	
	/*
	 * 학생 목록 페이징
	 */
	public Paging getPagingAdminStu(int curPage, String search, String category);
	/*
	 * 회원 정보 상세보기
	 */
	public Map<String, Object> selectStuDetail(int userNo);
	
	/*
	 * 학생이 작성한 모든 글 보기
	 * 
	 */	
	public Map<String, Object> selectStuAllList(int userNo);

	public Paging getPagingAdminTch(int curPage, String category, String search);
	/*
	 * 회원(선생님) 전체 조회
	 */
	public List<Map<String, Object>> selectTchList(Paging paging, String category);
	/*
	 * 회원(선생님)이 작성한 모든 게시글 조회
	 */
	public Map<String, Object> selectTchAllList(int userNo);
	
	

//	public Map<String, Object> selectAllList(int userNo);
	

}
