package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.privateplaylist.www.dto.Notice;

import common.util.Paging;

//이인주 : 관리자 공지사항 service

public interface NoticeService {

	//공지사항 전체 조회
	public List<Notice> selectNoticeList(Paging paging);

	//공지사항 상세 페이지
	public Notice selectNoticeone(int noticeNo);

	//공지사항 글쓰기
	public int insertNotice(Notice notice);

	//공지사항 수정하기
	public int updateNotice(Notice notice);

	//공지사항 삭제하기(상세보기 페이지에서 삭제)
	public int deleteNotice(int noticeNo);

	//공지사항 제목 내용 검색 결과
	public List<Notice> selectSearchNotice(Map<String, Object> searchMap);

	//공지사항 전체 리스트 페이징
	public Paging noticeListPaging(HttpServletRequest req);

	//공지사항 검색 리스트 페이징
	public Paging noticeSearchPaging(HttpServletRequest req, String keyword);

}
