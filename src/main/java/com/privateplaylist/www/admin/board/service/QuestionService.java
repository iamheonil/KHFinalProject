package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;

import common.util.Paging;

public interface QuestionService {

	//질문목록 전체 조회
	public List<Map<String, Object>> selectQuestionList(Paging paging);

	//질문목록 전체 페이징
	public Paging questionListPaging(HttpServletRequest req);
	
//	// 질문목록 상세 조회
	public Question selectQuestionone(int questionNo);

	//디테일뷰 댓글 대댓글 불러오기
	public List<QuestionComm> getReplyList(int commNo);
	//질문게시판 글 삭제하기 (상세보기 페이지에서 삭제)
	public int deleteQuestion(int questionNo);
	
	//댓글삭제
	public int deleteQuestionComm(int commNo);
	
	//페이징 객체
	public Paging questionSearchPaging(HttpServletRequest req, String keyword);
	
	//검색
	public List<Question> selectSearchQuestion(Map<String, Object> searchMap);
	
	//디테일페이지
	public List<Map<String, Object>> detailQuestion(int questionNo);

	//디테일
	public Map<String, Object> selectQuestionDetail(int questionNo);
	
	//댓글
	public List<Map<String, Object>> getQuestionComm(int questionNo);
	
	//댓글cnt
	public int getQuestionCommCnt(int questionNo);

	
	
	
}
