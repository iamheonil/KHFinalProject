package com.privateplaylist.www.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.member.dao.AdminMemberDao;
import com.privateplaylist.www.dto.Membership;

import common.util.Paging;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public Map<String, Object> selectStuList(int cPage, int cntPerPage) {//현재 페이지 //페이지당 노출할 게시글 수
		
		Map<String, Object> commandMap 	= new HashMap<String, Object>();
		 //페이징 처리를 위한 객체 생성
		 Paging p = new Paging(adminMemberDao.selectStuCnt(),cPage,cntPerPage);
		 System.out.println("총 개수 : "+adminMemberDao.selectStuCnt());
		 //현재 페이지에 필요한 게시물 목록
		 List<Membership> stulist = adminMemberDao.selectStuList(p);
		 commandMap.put("stulist", stulist);
		 commandMap.put("paging", p);
		return commandMap;
		
	}

}
