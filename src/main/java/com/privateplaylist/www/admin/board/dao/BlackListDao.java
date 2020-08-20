package com.privateplaylist.www.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class BlackListDao {
	
	private String namespace = "BlackListDao.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, Object>> selectAllBlackList(Paging paging){
		List<Map<String, Object>> list = sqlSession.selectList(namespace + "selectAllBlackList", paging);
		return list;
	}

	// 모든 신고 내역 수
	public int selectCntAllBlack() {
		int totalCnt = sqlSession.selectOne(namespace + "selectAllCntBlack");
		return totalCnt;
	}

	// 신고 반려
	public void updateBlacklistTurndown(int blacklistNo) {
		sqlSession.update(namespace + "updateBlacklistTurndown", blacklistNo);
	}

	/**
	 * 신고 삭제
	 * @param blacklistNo
	 */
	public void updateBlacklistDelete(int blacklistNo) {
		sqlSession.update(namespace + "updateBlacklistDelete", blacklistNo);
	}

	/**
	 * 신고글 가져오기
	 * @param blacklistNo
	 * @return
	 */
	public int selectReviewByBN(int blacklistNo) {
		return sqlSession.selectOne(namespace + "selectReviewByBN", blacklistNo);
	}

	/**
	 * 리뷰 삭제
	 * @param reviewNo
	 */
	public void deleteReview(int reviewNo) {
		sqlSession.update(namespace + "deleteReview", reviewNo);
	}
	
}