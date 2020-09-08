package com.privateplaylist.www.user.board.notice.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Notice;

import common.util.Paging;

@Repository
public class UserNoticeDao {
	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	//모든 공지사항 수 조회 - 페이징
	public int selectCntNotice() {
		return sqlSession.selectOne("UserNotice.selectCntNotice");
	}

	
	//모든 공지사항
	public List<Notice> selectNotice(Paging paging) {
		return sqlSession.selectList("UserNotice.selectNotice", paging);
	}


	//공지사항 상세
	public Notice selectNoticeDetail(int no) {
		return sqlSession.selectOne("UserNotice.selectNoticeDetail", no);
	}


	//공지사항 검색결과 수 
	public int selectCnNoticeSearch(String keyword) {
		return sqlSession.selectOne("UserNotice.selectCnNoticeSearch", keyword);
	}


	//공지사항 검색결과
	public List<Notice> selectNoticeSearch(Map<String, Object> searchMap) {
		return sqlSession.selectList("UserNotice.selectNoticeSearch", searchMap);
	}

}
