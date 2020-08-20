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

	//공지사항 
	public int insertNotice(Notice notice) {
		return sqlSession.insert("Notice.insertNotice",notice);
	}

	//공지사항 수정
	public int updateNotice(Notice notice) {
		return sqlSession.update("Notice.updateNotice",notice);
	}

	//공지사항 삭제(상세보기 페이지에서 삭제)
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete("Notice.deleteNotice",noticeNo);
	}

}
