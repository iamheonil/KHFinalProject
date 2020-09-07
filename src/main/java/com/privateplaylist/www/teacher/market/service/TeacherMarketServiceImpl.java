
package com.privateplaylist.www.teacher.market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.teacher.market.dao.TeacherMarketDao;

import common.util.Paging;

@Service
public class TeacherMarketServiceImpl implements TeacherMarketService{

	@Autowired 
	private TeacherMarketDao teacherMarketDao;
	
	@Override
	public Paging getPagingMarketTea(int curPage1, int userNo) {
		int totalCount = teacherMarketDao.selectCntAllMK(userNo);
		
		Paging paging = new Paging(totalCount, curPage1,5);
		
		return paging;
	}

	@Override
	public Paging getPagingMarketCommTea(int curPage2, int userNo) {
		int totalCount = teacherMarketDao.selectCntAllMKComm(userNo);
		
		Paging paging = new Paging(totalCount, curPage2, 5);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectMarketTea(Paging paging1, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging1);
		map.put("userNo", userNo);
		
		return teacherMarketDao.selectMarketStu(map);
	}

	@Override
	public List<Map<String, Object>> selectMarketCommTea(Paging paging2, int userNo) {
	Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging2);
		map.put("userNo", userNo);
		
		return teacherMarketDao.selectMarketCommStu(map);
	}

}