package com.privateplaylist.www.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindLessonDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int selectTotalCnt(Map<String, Object> option) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberFindLesson.selectTotalCnt",option);
	}

	public List<Map<String, Object>> selectByOption(Map<String, Object> optionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MemberFindLesson.selectByOption",optionMap);
	}



}
