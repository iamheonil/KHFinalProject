
package com.privateplaylist.www.teacher.market.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface TeacherMarketService {

	// 마켓페이징
	public Paging getPagingMarketTea(int curPage1, int userNo);
	
	// 내가 쓴 댓글 페이징
	public Paging getPagingMarketCommTea(int curPage2, int userNo);
	
	//내가 쓴 글 리스트
	public List<Map<String, Object>> selectMarketTea(Paging paging1, int userNo);
	
	//내가 쓴 댓글 가져오기
	public List<Map<String, Object>> selectMarketCommTea(Paging paging2, int userNo);

}