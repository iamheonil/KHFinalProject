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

	public int selectStuCnt(String search) {
		return sqlSession.selectOne("Member.selectStuCnt", search);
	}

	public List<Membership> selectStuList(Paging page) {
		return sqlSession.selectList("Member.selectStuList", page);
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

	public int selectTchCnt(String search) {
		return sqlSession.selectOne("Member.selectTchCnt", search);
	}

	public List<Membership> selectTchList(Paging paging) {
		return sqlSession.selectList("Member.selectTchList", paging);
	}

	public List<Map<String, Object>> selectTchReviewList(int userNo) {
		return sqlSession.selectList("Member.selectTchReviewList", userNo);
	}

	

}
