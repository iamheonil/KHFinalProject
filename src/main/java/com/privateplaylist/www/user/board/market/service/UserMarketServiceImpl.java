package com.privateplaylist.www.user.board.market.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.user.board.market.dao.UserMarketDao;

@Service
public class UserMarketServiceImpl implements UserMarketService{

	@Autowired
	private UserMarketDao userMarketDao;
	
	@Override
	public boolean compareUserWriter() {
		return false;
	}

	@Override
	public Market getMarketInfo(int mkno) {
		Market market = userMarketDao.getMarketInfo(mkno);
		return market;
	}

}
