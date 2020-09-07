package com.privateplaylist.www.user.board.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.user.board.review.dao.UserReviewDao;

import common.util.PagingReview;

@Service
public class UserReviewService {
	
	
	@Autowired
	UserReviewDao userReviewDao;

	
	//모든 리뷰 목록
	public List<Map<String, Object>> selectReviewList(PagingReview paging) {
		return userReviewDao.selectReviewList(paging);
	}

	
	//모든 리뷰 목록 - 페이징
	public PagingReview reviewPaging(int curPage) {
		
		//모든 리뷰 수 조회 - 페이징
		int totalCount = userReviewDao.selectCntReview();
		
		//paging객체 생성
		PagingReview paging = new PagingReview(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
	
	//수강한 과외 목록 - 후기 쓸 수 있는 목록
	public List<Map<String, Object>> selectLessonList(int userNo) {
		return userReviewDao.selectLessonList(userNo);
	}

	
	//후기 등록
	public int insertReview(Review review) {
		return userReviewDao.insertReview(review);
	}

	
	//후기 작성 여부 업데이트
	public int updateReviewReg(int connLessonNo) {
		return userReviewDao.updateReviewReg(connLessonNo);
	}

	
	//후기 검색 수 조회 - 페이징
	public PagingReview reviewSearchPaging(String keyword, int curPage) {
		
		//검색 후 총 게시글 수를 조회한다
		int totalCount = userReviewDao.selectCntReviewSearch(keyword);
		
		//paging객체 생성
		PagingReview paging = new PagingReview(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	
	//검색된 후기 목록
	public List<Map<String, Object>> selectReviewSearch(Map<String, Object> searchMap) {
		return userReviewDao.selectReviewSearch(searchMap);
	}

	

}
