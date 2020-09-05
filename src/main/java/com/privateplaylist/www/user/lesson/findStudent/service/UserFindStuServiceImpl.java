package com.privateplaylist.www.user.lesson.findStudent.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.FindStudent;
import com.privateplaylist.www.user.lesson.findStudent.dao.UserFindStuDao;

import common.util.Paging;

//20200904 이인주 : user > find_student > serviceImpl

@Service
public class UserFindStuServiceImpl implements UserFindStuService{

	@Autowired
	UserFindStuDao userFindStuDao;
	
	@Override
	public Paging userFindStuListPaging(HttpServletRequest req) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//classbooking 테이블의 총 게시글 수를 조회한다
		int totalCount = userFindStuDao.selectCntUserFindStuAll();
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> userFindStuList(Paging paging) {
		return userFindStuDao.userFindStuList(paging);
	}
}