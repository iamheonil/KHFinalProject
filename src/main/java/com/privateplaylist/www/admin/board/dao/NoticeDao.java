package com.privateplaylist.www.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Notice;

import common.util.Paging;

//이인주 : 관리자 공지사항 dao

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//공지사항 전체 조회
	public List<Notice> selectNoticeList(Paging paging){
		return sqlSession.selectList("Notice.selectNoticeList",paging);
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

	//공지사항 검색 결과
	public List<Notice> selectSearchNotice(Map<String, Object> searchMap) {
		return sqlSession.selectList("Notice.selectSearchNotice",searchMap);
	}

	//총 게시글 수 조회
	public int selectCntNoticeAll() {
		return sqlSession.selectOne("Notice.selectCntNoticeAll");
	}

	//검색 페이징
	public int selectCntNoticeSearchAll(String keyword) {
		return sqlSession.selectOne("Notice.selectCntNoticeSearchAll",keyword);
	}

}
