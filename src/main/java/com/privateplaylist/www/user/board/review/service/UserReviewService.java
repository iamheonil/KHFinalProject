package com.privateplaylist.www.user.board.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.user.board.review.dao.UserReviewDao;

@Service
public class UserReviewService {
	
	
	@Autowired
	UserReviewDao userReviewDao;

	
	//모든 리뷰 목록
	public List<Map<String, Object>> selectReviewList() {
		return userReviewDao.selectReviewList();
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

}
