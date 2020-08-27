package com.privateplaylist.www.teacher.lesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class LessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertLesson(Map<String, Object> map) {
		return sqlSession.insert("findLesson.insertLesson", map);
	}

	public int getLessonListCnt(int userNo) {
		return sqlSession.selectOne("findLesson.getLessonListCnt", userNo);
	}


	public List<Map<String, Object>> selectLessonList(Map<String, Object> map) {
		return sqlSession.selectList("findLesson.selectLessonList", map);
	}

	public int deleteLesson(int lessonNo) {
		return sqlSession.delete("findLesson.deleteLesson", lessonNo);
	}

	public void endLesson(int lessonNo) {
		sqlSession.update("findLesson.endLesson", lessonNo);
	}
	
	
}
