package com.privateplaylist.www.teacher.lesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.FindLesson;

import common.util.Paging;

@Repository
public class LessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertLesson(FindLesson findLesson) {
		System.out.println("dao - findLesson : " + findLesson);
		return sqlSession.insert("findLesson.insertLesson", findLesson);
	}
	
	//파일 테이블에 파일정보 추가
	public int insertFile(Map<String,String> fileInfo) {
		System.out.println(fileInfo);
		return sqlSession.insert("findLesson.insertFile",fileInfo);
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
