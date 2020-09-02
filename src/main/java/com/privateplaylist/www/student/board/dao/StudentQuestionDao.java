package com.privateplaylist.www.student.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

@Repository
public class StudentQuestionDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectQuestionListCnt(int userNo) {
		return sqlSession.selectOne("StuQuestion.selectQuestionListCnt", userNo);
	}

	public List<Question> selectQuestionList(Map<String, Object> map) {
		return sqlSession.selectList("StuQuestion.selectQuestionList", map);
	}

	public List<QuestionComm> selectQuestionCommList(Map<String, Object> map) {
		return sqlSession.selectList("StuQuestion.selectQuestionCommList", map);
	}

	public int selectQuestionCommListCnt(int userNo) {
		return sqlSession.selectOne("StuQuestion.selectQuestionCommListCnt", userNo);
	}

}
