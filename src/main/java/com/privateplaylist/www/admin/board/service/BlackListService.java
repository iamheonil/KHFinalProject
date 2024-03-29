package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.util.Paging;

public interface BlackListService {

	/*
	 * 후기게시판 전체 신고내역
	 */
	public List<Map<String, Object>> selectAllBlackList(Paging paging, String category);

	/*
	 * 후기게시판 신고 내역 페이징
	 */
	public Paging getPagingBlack(int curPage, String category, String search);

	/**
	 * 후기게시판 신고 반려
	 * @param list
	 */
	public void turndownReview(List<Integer> list);

	/**
	 * 후기게시판 신고 게시글 삭제
	 * @param list
	 */
	public void deleteReview(List<Integer> list);

	/**
	 * 후기게시판 신고된 상태 개수
	 * @return
	 */
	public int selectReportCnt();

	/**
	 * 
	 * @param mList
	 */
	public void turndownMarket(List<Integer> mList);

	public void deleteMarket(List<Integer> mList);

	// 질문 신고 반려
	public void turndownQuestion(List<Integer> qList);

	// 질문 신고 삭제
	public void deleteQuestion(List<Integer> qList);

	// 질문 상세
	public Map<String, Object> getReviewByNo(int no);


}