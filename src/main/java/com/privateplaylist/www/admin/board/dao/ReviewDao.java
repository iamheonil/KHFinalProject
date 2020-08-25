package com.privateplaylist.www.admin.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Review> selectReviewList(Paging paging) {
		return sqlSession.selectList("Review.selectReviewList",paging);
	}

	public int selectCntReviewAll() {
		return sqlSession.selectOne("Review.selectCntReviewAll");
	}

}
