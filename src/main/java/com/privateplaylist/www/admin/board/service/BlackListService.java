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
	public Paging getPagingBlack(int curPage);

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

}