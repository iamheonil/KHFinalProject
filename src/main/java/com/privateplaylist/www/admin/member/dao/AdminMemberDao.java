package com.privateplaylist.www.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Question;

import common.util.Paging;



@Repository
public class AdminMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectStuCnt(Map<String, String> map) {
		return sqlSession.selectOne("Member.selectStuCnt", map);
	}

	public List<Map<String, Object>> selectStuList(Map<String, Object> bMap) {
		return sqlSession.selectList("Member.selectStuList", bMap);
	}

	public Membership selectStuDetail(int userNo) {
		return sqlSession.selectOne("Member.selectStuDetail", userNo);
	}

	public List<Question> selectQuestionList(int userNo) {
		return sqlSession.selectList("Member.selectQuestionList", userNo);
	}
	
	public List<Map<String, Object>> selectStuReviewList(int userNo) {
		return sqlSession.selectList("Member.selectStuReviewList", userNo);
	}

	public List<Market> selectMarketList(int userNo) {
		return sqlSession.selectList("Member.selectStuMarketList", userNo);
	}

	public int selectTchCnt(Map<String, String> map) {
		return sqlSession.selectOne("Member.selectTchCnt", map);
	}

	public List<Map<String, Object>> selectTchList(Map<String, Object> bMap) {
		return sqlSession.selectList("Member.selectTchList", bMap);
	}

	public List<Map<String, Object>> selectTchReviewList(int userNo) {
		return sqlSession.selectList("Member.selectTchReviewList", userNo);
	}

	

}
