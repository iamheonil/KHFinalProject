package com.privateplaylist.www.teacher.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Question;

import common.util.Paging;

public interface TeacherQuestionService {

	// 질문내역 select
	public List<Question> selectQuestionList(Paging paging);
	//페이징 처리
	public Paging questionListPaging(HttpServletRequest req);


}
