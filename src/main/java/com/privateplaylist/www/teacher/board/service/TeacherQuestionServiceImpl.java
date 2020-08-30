package com.privateplaylist.www.teacher.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.teacher.board.dao.TeacherQuestionDao;

import common.util.Paging;

@Service
public class TeacherQuestionServiceImpl implements TeacherQuestionService{

	@Autowired
	private TeacherQuestionDao teacherQuestionDao;
	@Override
	public List<Question> selectQuestionList(Paging paging) {
		List<Question> questionList = teacherQuestionDao.selectQuestionList(paging);
		return questionList;
	}

	@Override
	public Paging questionListPaging(HttpServletRequest req) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//테이블의 총 게시글 수를 조회한다
		int totalCount = teacherQuestionDao.selectCntQuestionAll();
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

}
