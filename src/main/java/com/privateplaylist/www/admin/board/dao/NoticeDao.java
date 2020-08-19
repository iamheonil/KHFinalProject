package com.privateplaylist.www.admin.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//공지사항 전체 조회
	public List<Notice> selectNoticeList(){
		return sqlSession.selectList("Notice.selectNoticeList");
	}

	//상세페이지 조회
	public Notice selectNoticeone(int noticeNo) {
		return sqlSession.selectOne("Notice.selectNoticeone",noticeNo);
	}

}
