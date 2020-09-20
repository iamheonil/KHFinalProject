package com.privateplaylist.www.student.board.service;

import java.util.List;
import java.util.Map;

import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.member.vo.Member;

import common.util.Paging;

public interface StudentReviewService {
	
	//페이징처리
	public Paging getPagingStuReview(int curPage, Member loginUser);
	//리뷰 리스트 불러오기
	public List<Map<String, Object>> selectReviewList(Paging paging,Member loginUser);
	
//	public List<Map<String, Object>> selectReviewList(Map<String, Object> paging);
	

}
