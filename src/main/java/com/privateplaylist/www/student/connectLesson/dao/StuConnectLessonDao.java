package com.privateplaylist.www.student.connectLesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StuConnectLessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	public List<Map<String, Object>> selectEndLesson(Map<String, Object> map) {
		return sqlSession.selectList("StuConnectLesson.selectEndLesson",map);
	}

	public int selectCntEndLesson(int userNo) {
		return sqlSession.selectOne("StuConnectLesson.selectCntEndLesson",userNo);
	}

}
