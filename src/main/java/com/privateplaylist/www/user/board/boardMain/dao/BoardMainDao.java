package com.privateplaylist.www.user.board.boardMain.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Market;
import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;

@Repository
public class BoardMainDao {

	
    @Autowired
    SqlSessionTemplate sqlSession;
	
    
    //공지사항
	public List<Map<String, Object>> selectNotice() {
		return sqlSession.selectList("BoardMain.selectNotice");
	}

	//후기게시판
	public List<Map<String, Object>> selectReview() {
		return sqlSession.selectList("BoardMain.selectReview");
	}

	//질문게시판
	public List<Map<String, Object>> selectQuestion() {
		return sqlSession.selectList("BoardMain.selectQuestion");
	}

	//중고장터
	public List<Map<String, Object>> selectMarket() {
		return sqlSession.selectList("BoardMain.selectMarket");
	}

	
}
