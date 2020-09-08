package com.privateplaylist.www.user.board.boardBlackList.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardBlackListDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	//신고 insert
	public int insertBoardBlackList(Map<String, Object> map) {
		return sqlSession.insert("BoardBlackList.insertBoardBlackList", map);
	}

}
