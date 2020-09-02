package com.privateplaylist.www.user.board.market.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Market;

@Repository
public class UserMarketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "dao.UserMarketDao.";
	
	public Market getMarketInfo(int mkno) {
		return sqlSession.selectOne(namespace + "getMarketInfo", mkno);
	}

}
