package com.privateplaylist.www.user.board.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;

import common.util.PagingReview;

@Repository
public class UserReviewDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//모든 리뷰 목록
	public List<Map<String, Object>> selectReviewList(PagingReview paging) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("paging", paging);
		
		return sqlSession.selectList("UserReview.selectReviewList", map);
	}
	
	//모든 리뷰 수 조회 - 페이징
	public int selectCntReview() {
		return sqlSession.selectOne("UserReview.selectCntReview");
	}

	//수강한 과외 목록 - 후기 쓸 수 있는 목록
	public List<Map<String, Object>> selectLessonList(int userNo) {
		return sqlSession.selectList("UserReview.selectLessonList", userNo);
	}

	//후기 등록
	public int insertReview(Review review) {
		return sqlSession.insert("UserReview.insertReview", review);
	}

	//후기 작성 여부 업데이트
	public int updateReviewReg(int connLessonNo) {
		return sqlSession.update("UserReview.updateReviewReg", connLessonNo);
	}

	//후기 검색 수 조회 - 페이징
	public int selectCntReviewSearch(String keyword) {
		return sqlSession.selectOne("UserReview.selectCntReviewSearch", keyword);
	}

	//검색된 후기 목록
	public List<Map<String, Object>> selectReviewSearch(Map<String, Object> searchMap) {
		return sqlSession.selectList("UserReview.selectReviewSearch", searchMap);
	}

	

}
