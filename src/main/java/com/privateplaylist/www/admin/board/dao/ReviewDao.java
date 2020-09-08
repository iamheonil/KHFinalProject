package com.privateplaylist.www.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> selectReviewList(Paging paging) {
		return sqlSession.selectList("Review.selectReviewList",paging);
	}

	public int selectCntReviewAll() {
		return sqlSession.selectOne("Review.selectCntReviewAll");
	}

	public int deleteReview(int reviewNo) {
		return sqlSession.delete("Review.deleteReview",reviewNo);
	}

	
	public List<Review> selectSearchReview(Map<String, Object> searchMap) {
		return sqlSession.selectList("Review.selectSearchReview",searchMap);
	}

	public int selectCntReviewSearchAll(String keyword) {
		return sqlSession.selectOne("Review.selectCntReviewSearchAll",keyword);
	}

}
