package com.privateplaylist.www.student.blackList.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface StudentBlackListService {

	//페이징
	public Paging getPagingBlack(int curPage, String category, String userNo);

	//신고 목록
	public List<Map<String, Object>> selectAllBlackList(Paging paging, String category);

	//신고 수 
	public int selectCnt(String userNo);

}
