package com.privateplaylist.www.admin.market.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class MarketDao {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	
	//중고장터 게시물의 수를 불러옴
	public int marketCnt() {
		return sqlsession.selectOne("AdminMarket.selectMarketCnt");
	}
	
	//중고장터 게시물의 리스트를 불러옴
	public List<Map<String,Object>> getMarketList(Paging p){
		return sqlsession.selectList("AdminMarket.selectMarketList",p);
	}

}
