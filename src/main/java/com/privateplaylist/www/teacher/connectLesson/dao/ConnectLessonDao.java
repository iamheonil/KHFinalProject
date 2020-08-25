package com.privateplaylist.www.teacher.connectLesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class ConnectLessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "dao.ConnectLessonDao.";
	
	public List<Map<String, Object>> selectConnectStu(Paging paging) {
		return sqlSession.selectList(namespace + "selectConnectStu", paging);
	}

	public int selectCntAllStu(int userNo) {
		return sqlSession.selectOne(namespace + "selectCntAllStu", userNo);
	}

}
