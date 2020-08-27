package com.privateplaylist.www.teacher.blackLIst.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public class TeacherBlackListDao {
	
	private String namespace = "TeacherBlacklist.";
	
    @Autowired
    SqlSessionTemplate sqlSession;
    
    public List<Map<String, Object>> selectAllBlackList(Map<String, Object> bMap){
		List<Map<String, Object>> list = sqlSession.selectList(namespace + "selectAllBlackList", bMap);
		return list;
	}
	
	// 게시판 모든 신고 내역 수
	public int selectCntAllBlack(Map<String, String> map) {
		int totalCnt = sqlSession.selectOne(namespace + "selectAllCntBlack", map);
		return totalCnt;
	}


	// 후기게시판 신고 반려
	public void updateBlacklistTurndown(int blacklistNo) {
		sqlSession.update(namespace + "updateBlacklistTurndown", blacklistNo);
	}

	/**
	 * 후기게시판 신고 삭제
	 * @param blacklistNo
	 */
	public void updateBlackReivewDelete(int blacklistNo) {
		sqlSession.update(namespace + "updateBlackReivewDelete", blacklistNo);
	}

	/**
	 * 후기게시판 신고글 가져오기
	 * @param blacklistNo
	 * @return
	 */
	public int selectReviewByBN(int blacklistNo) {
		return sqlSession.selectOne(namespace + "selectReviewByBN", blacklistNo);
	}

	/**
	 * 후기게시판 리뷰 삭제
	 * @param reviewNo
	 */
	public void deleteReview(int reviewNo) {
		sqlSession.update(namespace + "deleteReview", reviewNo);
	}
	
	public int selectReportCnt() {
		return sqlSession.selectOne(namespace + "selectReportCnt");
	}

	public int selectMarketByBN(int no) {
		return sqlSession.selectOne(namespace + "selectMarketByBN", no);
	}

	public void deleteMarket(int marketNo) {
		sqlSession.update(namespace + "deleteMarket", marketNo);
	}

	public void updateBlackMarketDelete(int marketNo) {
		sqlSession.update(namespace + "updateBlackMarketDelete", marketNo);
		
	}

	
	
	

}
