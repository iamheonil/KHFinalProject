package com.privateplaylist.www.student.market.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketStuDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "dao.MarketStuDao.";

	public int selectCntAllMK(int userNo) {
		return sqlSession.selectOne(namespace + "selectCntAllMK", userNo);
	}

	public List<Map<String, Object>> selectMarketStu(Map<String, Object> map) {
		return sqlSession.selectList(namespace + "selectMarketStu", map);
	}

}
