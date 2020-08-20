package com.privateplaylist.www.admin.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Membership;

import common.util.Paging;

@Repository
public class AdminMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectStuCnt() {
		return sqlSession.selectOne("Membership.selectStuCnt");
	}

	public List<Membership> selectStuList(Paging page) {
		return sqlSession.selectList("Membership.selectStuList", page);
	}

	public Membership selectStuDetail(int userNo) {
		return sqlSession.selectOne("Membership.selectStuDetail", userNo);
	}

}
