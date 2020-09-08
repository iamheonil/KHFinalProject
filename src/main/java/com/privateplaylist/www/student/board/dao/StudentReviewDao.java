package com.privateplaylist.www.student.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;

@Repository
public class StudentReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectReviewListCnt(int userNo) {
		return sqlSession.selectOne("StuReview.selectReviewListCnt", userNo);
	}

	public List<Review> selectReviewList(Map<String, Object> map) {
		return sqlSession.selectList("StuReview.selectReviewList", map);
	}
	
	
}
