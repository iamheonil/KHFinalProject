package com.privateplaylist.www.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.member.dao.AdminMemberDao;
import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public Map<String, Object> selectStuList(int cPage, int cntPerPage) {
		
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
	public Map<String, Object> selectAllList(int userNo) {
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
//		Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
	
		List<Question> stuQuestion = adminMemberDao.selectStuQuestionList(userNo);
		List<Map<String, Object>> stuReview = adminMemberDao.selectStuReviewList(userNo);
		List<Market> stuMarket = adminMemberDao.selectStuMarketList(userNo);
		commandMap.put("stuQuestion", stuQuestion);
		commandMap.put("stuReview", stuReview);
		commandMap.put("stuMarket", stuMarket);
//		commandMap.put("paging", p);
		return commandMap;
	}
	
//	@Override
//	public Map<String, Object> selectStuReviewList(int userNo) {
//		
//		Map<String, Object> commandMap 	= new HashMap<String, Object>();
////		Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
//		
//		List<Review> stuReview = adminMemberDao.selectStuReviewList(userNo);
//		commandMap.put("stuReview", stuReview);
////		System.out.println(stuReview);
////		commandMap.put("paging", p);
//		return commandMap;
//	}
	

}
