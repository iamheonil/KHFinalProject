package com.privateplaylist.www.user.board.boardBlackList.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.user.board.boardBlackList.dao.BoardBlackListDao;

@Service
public class BoardBlackListService {
	
	
	@Autowired
	BoardBlackListDao boardBlackListDao;

	//신고 insert
	public int insertBoardBlackList(Map<String, Object> map) {
		return boardBlackListDao.insertBoardBlackList(map);
	}

}
