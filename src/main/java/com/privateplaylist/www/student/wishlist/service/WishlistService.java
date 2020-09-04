package com.privateplaylist.www.student.wishlist.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface WishlistService {

	/**
	 * 찜하기 페이징
	 * @param curPage
	 * @param userNo
	 * @return
	 */
	public Paging getPagingWishStu(int curPage, int userNo);

	/**
	 * 찜한 과외 불러오기
	 * @param paging
	 * @param userNo
	 * @return
	 */
	public List<Map<String, Object>> selectWishStu(Paging paging, int userNo);

	/**
	 * 찜 하기 취소
	 * @param wishNo
	 * @return
	 */
	public int deleteWishlist(int wishNo);

	/**
	 * 과외 신청
	 * @param lessonNo
	 * @param teacherNo 
	 * @param teacherNo 
	 * @return
	 */
	public int insertConnLesson(int lessonNo, int studentNo, int teacherNo);

	/**
	 * 신청한 내역 확인
	 * @param lessonNo
	 * @param userNo
	 * @param teacherNo
	 * @return
	 */
	public int checkalreadysign(int lessonNo, int studentNo, int teacherNo);

}
