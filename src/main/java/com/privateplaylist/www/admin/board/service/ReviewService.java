package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;

import common.util.Paging;

public interface ReviewService {

	// 리뷰게시판 전체 조회
	public List<Map<String, Object>> selectReviewList(Paging paging);
	// 리뷰게시판 페이징
	public Paging reviewListPaging(HttpServletRequest req);
	
	//삭제
	public int deleteReview(int reviewNo);
	
	//검색페이징
	public Paging reviewSearchPaging(HttpServletRequest req, String keyword);
	//검색
	public List<Map<String, Object>> selectSearchReview(Map<String, Object> searchMap);

}
