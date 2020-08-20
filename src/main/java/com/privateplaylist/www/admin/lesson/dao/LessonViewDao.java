package com.privateplaylist.www.admin.lesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LessonViewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//과외 전체 리스트 출력
	public List<Map<String, Object>> selectLessonAll() {
		return sqlSession.selectList("FindLesson.selectLessonAll");
	}

}
