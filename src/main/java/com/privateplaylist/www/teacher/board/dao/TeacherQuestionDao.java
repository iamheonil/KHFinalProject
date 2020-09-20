package com.privateplaylist.www.teacher.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

import common.util.Paging;

@Repository
public class TeacherQuestionDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectQuestionListCnt(int userNo) {
		return sqlSession.selectOne("TeacherQuestion.selectQuestionListCnt", userNo);
	}
	public List<Question> selectQuestionList(Map<String, Object> map) {
		return sqlSession.selectList("TeacherQuestion.selectQuestionList", map);
	}

	
	public List<QuestionComm> selectQuestionCommList(Map<String, Object> map) {
		return sqlSession.selectList("TeacherQuestion.selectQuestionCommList", map);
	}

	public int selectQuestionCommListCnt(int userNo) {
		return sqlSession.selectOne("TeacherQuestion.selectQuestionCommListCnt", userNo);
	}



	

	
}