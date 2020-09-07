package com.privateplaylist.www.user.board.market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.MkFile;
import com.privateplaylist.www.user.board.market.dao.UserMarketDao;

import common.util.Paging;

@Service
public class UserMarketServiceImpl implements UserMarketService{

	@Autowired
	private UserMarketDao userMarketDao;

	@Override
	public Map<String, Object> getMarketInfo(int mkno) {
		Map<String, Object> market = userMarketDao.getMarketInfo(mkno);
		return market;
	}

	@Override
	public List<MkFile> getMarketFile(int mkno) {
		return userMarketDao.getMarketFile(mkno);
	}

	@Override
	public List<Map<String, Object>> getMarketlist(Paging p) {
		return userMarketDao.getMarketlist(p);
	}

	@Override
	public Paging getPagingMkList(int curPage, String search) {
		
		int totalCount = userMarketDao.selectCntAllMK(search);
		
		Paging paging = new Paging(totalCount, curPage); 
		paging.setSearch(search);
		return paging;
	}

}
