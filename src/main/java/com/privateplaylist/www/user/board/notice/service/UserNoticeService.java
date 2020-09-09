package com.privateplaylist.www.user.board.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Notice;
import com.privateplaylist.www.user.board.notice.dao.UserNoticeDao;

import common.util.Paging;

@Service
public class UserNoticeService {

	@Autowired
	UserNoticeDao userNoticeDao;

	//모든 공지사항 수 조회 - 페이징
	public Paging noticeListPaging(int curPage) {
		
		//모든 공지사항 수 조회 - 페이징
		int totalCount = userNoticeDao.selectCntNotice();
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	
	//모든 공지사항
	public List<Notice> selectNotice(Paging paging) {
		return userNoticeDao.selectNotice(paging);
	}

	
	//공지사항 상세
	public Notice selectNoticeDetail(int no) {
		return userNoticeDao.selectNoticeDetail(no);
	}


	//공지사항 검색 - 페이징
	public Paging noticeListSearchPaging(String keyword, int curPage) {
		
		//검색 후 총 게시글 수를 조회한다
		int totalCount = userNoticeDao.selectCnNoticeSearch(keyword);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}


	//공지사항 검색 결과
	public List<Notice> selectNoticeSearch(Map<String, Object> searchMap) {
		return userNoticeDao.selectNoticeSearch(searchMap);
	}
	
	
}
