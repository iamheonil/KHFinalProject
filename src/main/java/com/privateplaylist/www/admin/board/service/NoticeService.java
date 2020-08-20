package com.privateplaylist.www.admin.board.service;

import java.util.List;

import com.privateplaylist.www.dto.Notice;

public interface NoticeService {

	//공지사항 전체 조회
	public List<Notice> selectNoticeList();

	//공지사항 상세 페이지
	public Notice selectNoticeone(int noticeNo);

	//공지사항 글쓰기
	public int insertNotice(Notice notice);

	//공지사항 수정하기
	public int updateNotice(Notice notice);

	//공지사항 삭제하기(상세보기 페이지에서 삭제)
	public int deleteNotice(int noticeNo);

}
