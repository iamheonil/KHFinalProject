package com.privateplaylist.www.student.market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.student.market.dao.MarketStuDao;

import common.util.Paging;

@Service
public class MarketStuServiceImpl implements MarketStuService {

	@Autowired
	private MarketStuDao marketStuDao;
	
	@Override
	public Paging getPagingMarketStu(int curPage, int userNo) {
		int totalCount = marketStuDao.selectCntAllMK(userNo);
		
		Paging paging = new Paging(totalCount, curPage, 5);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectMarketStu(Paging paging, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("userNo", userNo);
		
		return marketStuDao.selectMarketStu(map);
	}

	@Override
	public Paging getPagingMarketCommStu(int curPage2, int userNo) {
		int totalCount = marketStuDao.selectCntAllMKComm(userNo);
		
		Paging paging = new Paging(totalCount, curPage2, 5);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectMarketCommStu(Paging paging2, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging2);
		map.put("userNo", userNo);
		
		return marketStuDao.selectMarketCommStu(map);
	}

}
