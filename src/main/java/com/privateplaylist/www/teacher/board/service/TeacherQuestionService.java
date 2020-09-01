package com.privateplaylist.www.teacher.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

import common.util.Paging;

public interface TeacherQuestionService {

	// 질문내역 select
	public List<Question> selectQuestionList(Paging paging);
	//페이징 처리
	public Paging questionListPaging(HttpServletRequest req);
	//글삭제
	public int deleteQuestion(int questionNo);
	//댓글삭제
	public int deleteQuestionComm(int questionNo);
	//검색
	public Paging questionSearchPaging(HttpServletRequest req, String keyword);
	//검색리스트
	public List<Question> selectSearchQuestion(Map<String, Object> searchMap);
	
	//디테일
	public Question selectQuestionone(int questionNo);
	//댓글리스트
	public List<QuestionComm> getReplyList(int questionNo);


}
