package com.privateplaylist.www.teacher.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.board.dao.TeacherQuestionDao;

import common.util.Paging;

@Service
public class TeacherQuestionServiceImpl implements TeacherQuestionService{

	@Autowired
	private TeacherQuestionDao teacherQuestionDao;
	
	@Override
	public Paging getPagingTeaQuestion(int curPage, Member loginUser) {
		int totalCount = teacherQuestionDao.selectQuestionListCnt(loginUser.getUserNo());

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Question> selectQuestionList(Paging paging, Member loginUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("user", loginUser);
		
		List<Question> questionlist = teacherQuestionDao.selectQuestionList(map);
		
		return questionlist;
	}
	
	
	
	
	

	@Override
	public List<QuestionComm> selectQuestionCommList(Paging paging, Member loginUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("user", loginUser);
		
		List<QuestionComm> questionlist = teacherQuestionDao.selectQuestionCommList(map);
		
		return questionlist;
	}

	@Override
	public Paging getPagingTeaQuestionComm(int curPage, Member loginUser) {
		int totalCount = teacherQuestionDao.selectQuestionCommListCnt(loginUser.getUserNo());

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	

}
