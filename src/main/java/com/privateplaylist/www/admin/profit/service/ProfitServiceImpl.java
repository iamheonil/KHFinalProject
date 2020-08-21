package com.privateplaylist.www.admin.profit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.profit.dao.ProfitDao;

@Service
public class ProfitServiceImpl implements ProfitService{
	
	@Autowired
	private ProfitDao profitDao;

}
