package com.privateplaylist.www.admin.lesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LessonConfirmDao {
	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	//검토할 과외 조회
	public List<Map<String, Object>> selectConfirmLesson() {
		
		return sqlSession.selectList("FindLesson.selectConfirmLesson");
	}
	
	

}
