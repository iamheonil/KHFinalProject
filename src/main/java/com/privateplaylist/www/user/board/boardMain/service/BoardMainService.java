package com.privateplaylist.www.user.board.boardMain.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.user.board.boardMain.dao.BoardMainDao;

@Service
public class BoardMainService {
	
	
	@Autowired
	BoardMainDao boardMainDao;

	
	//공지사항
	public List<Map<String, Object>> selectNotice() {
		return boardMainDao.selectNotice();
	}
	
	//후기게시판
	public List<Map<String, Object>> selectReview() {
		return boardMainDao.selectReview();
	}

	//질문게시판
	public List<Map<String, Object>> selectQuestion() {
		return boardMainDao.selectQuestion();
	}

	//중고장터
	public List<Map<String, Object>> selectMarket() {
		return boardMainDao.selectMarket();
	}
	
	
}
