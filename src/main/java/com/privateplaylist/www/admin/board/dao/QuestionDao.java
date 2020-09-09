package com.privateplaylist.www.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

import common.util.Paging;

@Repository
public class QuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//질문게시판 전체 조회
	public List<Question> selectQuestionList(Paging paging) {
		return sqlSession.selectList("Question.selectQuestionList",paging);
	}
	
	//총 게시글 수 조회
	public int selectCntQuestionAll() {
		return sqlSession.selectOne("Question.selectCntQuestionAll");
	}
	
	//질문게시판 상세 조회
	public Question selectQuestionone(int questionNo) {
		return sqlSession.selectOne("Question.selectQuestionone",questionNo);
	}
	
	// 게시물 삭제
	public int deleteQuestion(int questionNo) {
		return sqlSession.delete("Question.deleteQuestion",questionNo);
	}
	
	//게시물 파일 삭제
	public int deleteQuestionFile(int questionNo) {
		return sqlSession.delete("Question.deleteQuestionFile", questionNo);
	}
	//게시물 댓글 삭제
	public int deleteQuestionComm(int commNo) {
		return sqlSession.delete("Question.deleteQuestionComm", commNo);
	}


	
	//게시물 댓글
	public List<QuestionComm> getReplyList(int commNo) {
		return sqlSession.selectList("Question.selectQuestionComm",commNo);
	}

	//검색
	public List<Question> selectSearchQuestion(Map<String, Object> searchMap) {
		return sqlSession.selectList("Question.selectSearchQuestion",searchMap);
	}

	
	public int selectCntQuestionSearchAll(String keyword) {
		return sqlSession.selectOne("Question.selectCntQuestionSearchAll",keyword);
	}

//	public List<Map<String, Object>> detailQuestion(int questionNo, int commNo) {
//		return sqlSession.selectList("Question.selectDetailQuestion",questionNo);
//	}
	
	
}
