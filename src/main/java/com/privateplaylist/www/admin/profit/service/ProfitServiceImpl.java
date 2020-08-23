package com.privateplaylist.www.admin.profit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.profit.dao.ProfitDao;

@Service
public class ProfitServiceImpl implements ProfitService{
	
	@Autowired
	private ProfitDao profitDao;

	@Override
	public int selectprofit01() {
		return profitDao.selectprofit01();
	}
	
	@Override
	public int selectprofit02() {
		return profitDao.selectprofit02();
	}
	
	@Override
	public int selectprofit03() {
		return profitDao.selectprofit03();
	}
	
	@Override
	public int selectprofit04() {
		return profitDao.selectprofit04();
	}
	
	@Override
	public int selectprofit05() {
		return profitDao.selectprofit05();
	}
	
	@Override
	public int selectprofit06() {
		return profitDao.selectprofit06();
	}
	
	@Override
	public int selectprofit07() {
		return profitDao.selectprofit07();
	}
	
	@Override
	public int selectprofit08() {
		return profitDao.selectprofit08();
	}
	
	@Override
	public int selectprofit09() {
		return profitDao.selectprofit09();
	}
	
	@Override
	public int selectprofit10() {
		return profitDao.selectprofit10();
	}
	@Override
	public int selectprofit11() {
		return profitDao.selectprofit11();
	}
	
	@Override
	public int selectprofit12() {
		return profitDao.selectprofit12();
	}
	
}