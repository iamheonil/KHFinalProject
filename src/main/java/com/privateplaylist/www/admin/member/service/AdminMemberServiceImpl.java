package com.privateplaylist.www.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.member.dao.AdminMemberDao;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Question;

import common.util.Paging;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public Map<String, Object> selectStuList(int cPage, int cntPerPage) {//���� ������ //�������� ������ �Խñ� ��
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
		 Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);

		 List<Membership> stulist = adminMemberDao.selectStuList(p);
		 commandMap.put("stulist", stulist);
		 commandMap.put("paging", p);
		return commandMap;
		
	}

	
	//회원 정보 상세보기 
	@Override
	public Map<String, Object> selectStuDetail(int userNo) {
		
		Map<String,Object> commandMap = new HashMap<String, Object>();
		
		Membership member = adminMemberDao.selectStuDetail(userNo);
		
		commandMap.put("member",member);
		
		return commandMap;
	}


	@Override
	public Map<String, Object> selectQuestionList(int userNo) {
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
//		Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
	
		List<Question> stuQuestion = adminMemberDao.selectStuQuestionList(userNo);
		List<Question> stuReview = adminMemberDao.selectStuReviewList(userNo);
		commandMap.put("stuQuestion", stuQuestion);
		commandMap.put("stuReview", stuReview);
//		System.out.println(stuQuestion);
//		commandMap.put("paging", p);
		return commandMap;
	}
	
	@Override
	public Map<String, Object> selectStuReviewList(int userNo) {
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
//		Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
		
		List<Question> stuReview = adminMemberDao.selectStuReviewList(userNo);
		commandMap.put("stuReview", stuReview);
//		System.out.println(stuReview);
//		commandMap.put("paging", p);
		return commandMap;
	}
	

}
