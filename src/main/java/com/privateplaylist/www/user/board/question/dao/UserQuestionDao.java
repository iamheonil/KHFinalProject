package com.privateplaylist.www.user.board.question.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.dto.QuestionFile;

import common.util.Paging;

@Repository
public class UserQuestionDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectCntAllQuestion(String search) {
		return sqlSession.selectOne("UserQuestion.selectCntAllQuestion", search);
	}

	public List<Map<String, Object>> selectQuestionList(Paging paging) {
		return sqlSession.selectList("UserQuestion.selectQuestionList", paging);
	}

//	public Map<String, Object> getQuestionInfo(int questionNo) {
//		return sqlSession.selectOne("UserQuestion.getQuestionInfo", questionNo);
//	}

	public Map<String, Object> selectQuestionDetail(int questionNo) {
		return sqlSession.selectOne("UserQuestion.selectQuestionDetail", questionNo);
	}

	public List<Map<String, String>> selectQuestionFile(int questionNo) {
		return sqlSession.selectList("UserQuestion.selectQuestionFile", questionNo);
	}

	public int insertQuestion(Question question) {
		return sqlSession.insert("UserQuestion.insertQuestion", question);
	}

	public void insertFile(Map<String, String> f) {
		System.out.println("매퍼에 들어갈 파일 : "+f);
		sqlSession.insert("UserQuestion.insertFile", f);
	}

	public void insertComment(QuestionComm qcomm) {
		System.out.println(qcomm);
		sqlSession.insert("UserQuestion.insertComment", qcomm);
	}

	public List<Map<String, Object>> selectQuestionCommentByNo(int questionNo) {
		return sqlSession.selectList("UserQuestion.selectQuestionCommentByNo", questionNo);
	}

	public int updateQuestion(Question question) {
		System.out.println(question);
		return sqlSession.update("UserQuestion.updateQuestion", question);
	}

	public int deleteFile(int questionFileNo) {
		return sqlSession.delete("UserQuestion.deleteFile", questionFileNo);
	}

	public int getNextQuesstionNo() {
		return sqlSession.selectOne("getNextQuesstionNo");
	}

	public List<Map<String, Object>> selectQuestionReCommentByNo(int questionNo) {
		return sqlSession.selectList("UserQuestion.selectQuestionReCommentByNo", questionNo);
	}

	public List<Map<String, Object>> getQuestionComm(int questionNo) {
		return sqlSession.selectList("getQuestionComm", questionNo);
	}

	public void insertReComment(QuestionComm qcomm) {
		System.out.println("insertReComment에 넣을것들 : "+qcomm);
		sqlSession.insert("UserQuestion.insertReComment", qcomm);
	}

	public void updateComment(QuestionComm qcomm) {
		sqlSession.update("UserQuestion.updateComment", qcomm);
	}

	public void deleteComment(QuestionComm qcomm) {
		sqlSession.delete("UserQuestion.deleteComment", qcomm);
	}

	public void deleteQuestion(int questionNo) {
		sqlSession.delete("UserQuestion.deleteQuestion", questionNo);
	}

	public int selectCntQuestionComm(int questionNo) {
		return sqlSession.selectOne("UserQuestion.selectCntQuestionComm", questionNo);
	}
	
}
