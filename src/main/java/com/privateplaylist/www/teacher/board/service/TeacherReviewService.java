package com.privateplaylist.www.teacher.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

public interface TeacherReviewService {

	//리스트 조회
	public List<Review> selectReviewList(Paging paging);

	//페이징
	public Paging reviewListPaging(HttpServletRequest req);
}
