package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.util.Paging;

public interface BlackListService {

	/*
	 * 전체 신고내역
	 */
	public List<Map<String, Object>> selectAllBlackList(Paging paging);

	/*
	 * 신고 내역 페이징
	 */
<<<<<<< HEAD
	public Paging getPagingBlack(int curPage, String search);
=======
	public Paging getPagingBlack(int curPage);
>>>>>>> 0ba5af114f2dafa422c7da0e026308c87258d3b2

	/**
	 * 신고 반려
	 * @param req
	 */
	public void turndown(HttpServletRequest req);

	/**
	 * 신고 게시글 삭제
	 * @param req
	 */
	public void deleteReview(HttpServletRequest req);
<<<<<<< HEAD

	/**
	 * 신고된 상태 개수
	 * @return
	 */
	public int selectReportCnt();
=======
>>>>>>> 0ba5af114f2dafa422c7da0e026308c87258d3b2

}