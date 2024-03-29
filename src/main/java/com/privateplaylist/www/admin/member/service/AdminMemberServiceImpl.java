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

//	@Override
//	public Map<String, Object> selectStuList(int cPage, int cntPerPage) {
//		
//		Map<String, Object> commandMap 	= new HashMap<String, Object>();
//		 Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
//
//		 List<Membership> stulist = adminMemberDao.selectStuList(p);
//		 commandMap.put("stulist", stulist);
//		 commandMap.put("paging", p);
//		return commandMap;
//		
//	}


	@Override
	public List<Map<String, Object>> selectStuList(Paging paging, String category) {
		Map<String, Object> bMap 	= new HashMap<>();
		
		bMap.put("category", category);
		bMap.put("paging", paging);
		
		List<Map<String, Object>> stulist = adminMemberDao.selectStuList(bMap);
		
		return stulist;
	}
	
	 
	@Override
	public Paging getPagingAdminStu(int curPage, String category, String search) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("category", category);
		map.put("search", search);
		int totalCount = adminMemberDao.selectStuCnt(map);
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		paging.setSearch(search);
		
		return paging;
	}


	@Override
	public Map<String, Object> selectStuDetail(int userNo) {
		
		Map<String,Object> commandMap = new HashMap<String, Object>();
		
		Membership member = adminMemberDao.selectStuDetail(userNo);
		
		commandMap.put("member",member);
		
		return commandMap;
	}


	@Override
	public Map<String, Object> selectStuAllList(int userNo) {
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
//		Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
	
		List<Question> stuQuestion = adminMemberDao.selectQuestionList(userNo);
		List<Map<String, Object>> stuReview = adminMemberDao.selectStuReviewList(userNo);
		List<Market> stuMarket = adminMemberDao.selectMarketList(userNo);
		commandMap.put("stuQuestion", stuQuestion);
		commandMap.put("stuReview", stuReview);
		commandMap.put("stuMarket", stuMarket);
//		commandMap.put("paging", p);
		return commandMap;
	}

	
	@Override
	public Paging getPagingAdminTch(int curPage, String category, String search) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("category", category);
		map.put("search", search);
		
		int totalCount = adminMemberDao.selectTchCnt(map);
		
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		paging.setSearch(search);
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> selectTchList(Paging paging, String category) {
		
		Map<String, Object> bMap 	= new HashMap<>();
		
		bMap.put("category", category);
		bMap.put("paging", paging);
		
		List<Map<String, Object>> tchlist = adminMemberDao.selectTchList(bMap);
		
		return tchlist;	
	}
	
	@Override
	public Map<String, Object> selectTchAllList(int userNo) {
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
	
		List<Question> tchQuestion = adminMemberDao.selectQuestionList(userNo);
		List<Map<String, Object>> tchReview = adminMemberDao.selectTchReviewList(userNo);
		List<Market> tchMarket = adminMemberDao.selectMarketList(userNo);
		commandMap.put("tchQuestion", tchQuestion);
		commandMap.put("tchReview", tchReview);
		commandMap.put("tchMarket", tchMarket);
		return commandMap;
		
	}


	@Override
	public Map<String, Object> selectUserByNo(int userNo) {
		
		return adminMemberDao.selectUserByNo(userNo);
	}
	
	

}
