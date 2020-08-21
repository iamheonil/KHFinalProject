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


	//과외 상세 조회
	public Map<String, Object> selectLessonDetail(int no) {
		
		return sqlSession.selectOne("FindLesson.selectLessonDetail", no);
	}

	
	//과외 승인
	public int updateLessonStateAdmit(int no) {
		
		return sqlSession.update("FindLesson.updateLessonStateAdmit", no);
	}


	//과외 반려
	public int updateLessonStateDeny(int no) {
		
		return sqlSession.update("FindLesson.updateLessonStateDeny", no);
	}
	
	

}
