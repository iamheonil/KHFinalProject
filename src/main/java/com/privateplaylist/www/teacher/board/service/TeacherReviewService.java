package com.privateplaylist.www.teacher.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

public interface TeacherReviewService {

	//리스트 조회
	public List<Map<String, Object>> selectReviewList(Paging paging);

	//페이징
	public Paging reviewListPaging(HttpServletRequest req);
	
	
	//검색
	public List<Review> selectSearchReview(Map<String, Object> searchMap);

	//서칭페이징
	public Paging reviewSearchPaging(HttpServletRequest req, String keyword);
}
