package com.privateplaylist.www.teacher.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.member.vo.Member;

import common.util.Paging;

public interface TeacherQuestionService {

	public Paging getPagingTeaQuestion(int curPage, Member loginUser);

	public List<Question> selectQuestionList(Paging paging, Member loginUser);
	
	//댓글리스트
	public List<QuestionComm> selectQuestionCommList(Paging paging, Member loginUser);
	//페이징
	public Paging getPagingTeaQuestionComm(int curPage, Member loginUser);




}
