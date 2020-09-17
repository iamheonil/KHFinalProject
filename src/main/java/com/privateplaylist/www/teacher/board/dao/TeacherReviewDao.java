package com.privateplaylist.www.teacher.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Repository
public class TeacherReviewDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> selectReviewList(Paging paging) {
		Map<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		return sqlSession.selectList("TeacherReview.selectReviewList",map);
	}

	public int selectCntReviewAll() {
		return sqlSession.selectOne("TeacherReview.selectCntReviewAll");
	}


	public List<Review> selectSearchReview(Map<String, Object> searchMap) {
		return sqlSession.selectList("TeacherReview.selectSearchReview",searchMap);
	}
	public int selectCntReviewSearchAll(String keyword) {
		return sqlSession.selectOne("TeacherReview.selectCntReviewSearchAll",keyword);
	}

}
