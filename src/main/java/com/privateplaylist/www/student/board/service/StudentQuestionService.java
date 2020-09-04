package com.privateplaylist.www.student.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.QuestionComm;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.board.dao.StudentQuestionDao;

import common.util.Paging;

@Service
public class StudentQuestionService {
	
	@Autowired
	private StudentQuestionDao studentQuestionDao;

	public Paging getPagingStuQuestion(int curPage, Member loginUser) {
		
		int totalCount = studentQuestionDao.selectQuestionListCnt(loginUser.getUserNo());

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	public List<Question> selectQuestionList(Paging paging, Member loginUser) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("user", loginUser);
		
		List<Question> questionlist = studentQuestionDao.selectQuestionList(map);
		
		return questionlist;
	}

	public List<QuestionComm> selectQuestionCommList(Paging paging, Member loginUser) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("user", loginUser);
		
		List<QuestionComm> questionlist = studentQuestionDao.selectQuestionCommList(map);
		
		return questionlist;
	}

	public Paging getPagingStuQuestionComm(int curPage, Member loginUser) {
		
		int totalCount = studentQuestionDao.selectQuestionCommListCnt(loginUser.getUserNo());

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}


}
