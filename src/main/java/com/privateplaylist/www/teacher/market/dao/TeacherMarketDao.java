
package com.privateplaylist.www.teacher.market.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherMarketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectCntAllMK(int userNo) {
		return sqlSession.selectOne("TeacherMarket.selectCntAllMK", userNo);
	}

	public int selectCntAllMKComm(int userNo) {
		return sqlSession.selectOne("TeacherMarket.selectCntAllMKComm", userNo);
	}

	public List<Map<String, Object>> selectMarketStu(Map<String, Object> map) {
		return sqlSession.selectList("TeacherMarket.selectMarketTea",map);
	}

	public List<Map<String, Object>> selectMarketCommStu(Map<String, Object> map) {
		return sqlSession.selectList("TeacherMarket.selectMarketCommTea",map);
	}

}