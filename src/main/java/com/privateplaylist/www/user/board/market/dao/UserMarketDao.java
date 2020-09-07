package com.privateplaylist.www.user.board.market.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.MkFile;

import common.util.Paging;

@Repository
public class UserMarketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "dao.UserMarketDao.";
	
	public Map<String, Object> getMarketInfo(int mkno) {
		return sqlSession.selectOne(namespace + "getMarketInfo", mkno);
	}

	public List<MkFile> getMarketFile(int mkno) {
		return sqlSession.selectList(namespace + "getMarketFile", mkno);
	}

	public List<Map<String, Object>> getMarketlist(Paging p) {
		return sqlSession.selectList(namespace + "getMarketlist", p);
	}

	public int selectCntAllMK(String search) {
		return sqlSession.selectOne(namespace + "selectCntAllMK", search);
	}

}
