package com.privateplaylist.www.admin.lesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindStudentDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	//학생찾기 게시글 조회
	public List<Map<String, Object>> selectFindStudent() {
		
		return sqlSession.selectList("FindStudent.selectFindStudent");
	}

}
