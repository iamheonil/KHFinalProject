package com.privateplaylist.www.student.findStu.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.FindStudent;
import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.student.findStu.dao.FindStuDao;

import common.util.Paging;

//이인주  : 학생 마이페이지 >  학생 찾기 > serviceImpl

@Service
public class FindStuServiceImpl implements FindStuService{
	
	@Autowired
	FindStuDao findStuDao;
	
	@Override
	public List<FindStudent> findStuList(Map<Object, Object> findStuMap) {
		return findStuDao.findStuList(findStuMap);
	}
	
	@Override
	public Paging findStuListPaging(HttpServletRequest req, int userNo) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//classbooking 테이블의 총 게시글 수를 조회한다
		int totalCount = findStuDao.selectCntFindStuAll(userNo);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
	@Override
	public List<FindStudent> findStuSearch(Map<Object, Object> findStuSearchMap) {
		return findStuDao.findStuSearch(findStuSearchMap);
	}
	
	
	@Override
	public Paging findStuSearchPaging(Map<Object, Object> findStuPagingMap) {
		//전달 파라미터  curPage를 파싱한다
		String param = ((ServletRequest) findStuPagingMap.get("req")).getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//classbooking 테이블의 총 게시글 수를 조회한다
		int totalCount = findStuDao.findStuSearchPaging(findStuPagingMap);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
	@Override
	public int deleteFindStu(int findStuNo) {
		return findStuDao.deleteFindStu(findStuNo);	
	}
	
	@Override
	public int insertFindStu(FindStudent findStudent) {
		return findStuDao.insertFindStu(findStudent);
	}
	
	@Override
	public int updateState(FindStudent findStudent) {
		return findStuDao.updateState(findStudent);
	}

}
