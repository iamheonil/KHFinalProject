package com.privateplaylist.www.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;

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

	public List<Question> selectStuQuestionList(int userNo) {
		return sqlSession.selectList("Member.selectStuQuestionList", userNo);
	}
	
	public List<Map<String, Object>> selectStuReviewList(int userNo) {
		return sqlSession.selectList("Member.selectStuReviewList", userNo);
	}

	public List<Market> selectStuMarketList(int userNo) {
		return sqlSession.selectList("Member.selectStuMarketList", userNo);
	}

	public int selectTchCnt(String search) {
		return sqlSession.selectOne("Member.selectTchCnt", search);
	}

	public List<Membership> selectTchList(Paging paging) {
		return sqlSession.selectList("Member.selectTchList", paging);
	}
	

}
