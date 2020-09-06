package com.privateplaylist.www.user.lesson.findStudent.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

//20200904 이인주 : user > find_student > Dao

@Repository
public class UserFindStuDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	//검색 전 페이징 (전체 개수)
	public int selectCntUserFindStuAll() {
		return sqlSession.selectOne("UserFindStu.selectCntUserFindStuAll");
	}

	//검색 전 리스트
	public List<Map<String, Object>> userFindStuList(Paging paging) {
		return sqlSession.selectList("UserFindStu.userFindStuList",paging);
	}

	//디테일 페이지
	public Map<String, Object> detailFindStu(int findStuNo) {
		return sqlSession.selectOne("UserFindStu.detailFindStu",findStuNo);
	}
	
	

}
