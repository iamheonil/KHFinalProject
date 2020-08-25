package com.privateplaylist.www.teacher.connectLesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConnectLessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "dao.ConnectLessonDao.";
	
	public List<Map<String, Object>> selectConnectStu() {
		return sqlSession.selectList(namespace + "selectConnectStu");
	}

}
