package com.privateplaylist.www.student.blackList.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentBlackListDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	//신고목록 수 - 페이징
	public int selectCntAllBlack(Map<String, String> map) {
		
		int totalCnt = sqlSession.selectOne("StudentBlackList.selectCntAllBlack", map);
		
		return totalCnt;
	}

	
	//신고 글 목록
	public List<Map<String, Object>> selectAllBlackList(Map<String, Object> bMap) {
		
		List<Map<String, Object>> list = sqlSession.selectList("StudentBlackList.selectAllBlackList", bMap);
		
		return list;
	}
	
	
}
