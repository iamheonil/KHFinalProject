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

	public List<Question> selectQuestionList(Paging paging) {
		return sqlSession.selectList("TeacherQuestion.selectQuestionList",paging);
	}

	public int selectCntQuestionAll() {
		return sqlSession.selectOne("TeacherQuestion.selectCntQuestionAll");
	}

	public int deleteQuestion(int questionNo) {
		return sqlSession.delete("TeacherQuestion.deleteQuestion",questionNo);
	}

	public int deleteQuestionFile(int questionNo) {
		return sqlSession.delete("TeacherQuestion.deleteQuestionFile", questionNo);
		
	}

	public int deleteQuestionComm(int questionNo) {
		return sqlSession.delete("TeacherQuestion.deleteQuestionComm", questionNo);
	}

	public int selectCntQuestionSearchAll(String keyword) {
		return sqlSession.selectOne("TeacherQuestion.selectCntQuestionSearchAll",keyword);
	}

	public List<Question> selectSearchQuestion(Map<String, Object> searchMap) {
		return sqlSession.selectList("TeacherQuestion.selectSearchQuestion",searchMap);
	}
	
	//상세조회
	public Question selectQuestionone(int questionNo) {
		return sqlSession.selectOne("TeacherQuestion.selectQuestionone",questionNo);
	}

	public List<QuestionComm> getReplyList(int questionNo) {
		return sqlSession.selectList("TeacherQuestion.selectQuestionComm",questionNo);
	}

}
