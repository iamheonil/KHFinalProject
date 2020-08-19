package com.privateplaylist.www.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlackListDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, Object>> selectAllBlackList(){
		List<Map<String, Object>> list = sqlSession.selectList("BlackListDao.selectAllBlackList");
		return list;
	}
	
}
