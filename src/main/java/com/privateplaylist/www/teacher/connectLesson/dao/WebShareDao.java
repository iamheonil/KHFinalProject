package com.privateplaylist.www.teacher.connectLesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WebShareDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, Object>> selectConnectedLesson(int teaNo) {
		
		return sqlSession.selectList("WebShare.selectConnectedLesson", teaNo);
	}

}
