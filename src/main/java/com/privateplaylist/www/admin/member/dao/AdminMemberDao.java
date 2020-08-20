package com.privateplaylist.www.admin.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Question;

import common.util.Paging;

@Repository
public class AdminMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectStuCnt() {
		return sqlSession.selectOne("Member.selectStuCnt");
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
	
	public List<Question> selectStuReviewList(int userNo) {
		return sqlSession.selectList("Member.selectStuReviewList", userNo);
	}
	

}
