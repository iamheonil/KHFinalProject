package com.privateplaylist.www.admin.board.service;

import java.util.List;

import com.privateplaylist.www.dto.Notice;

public interface NoticeService {

	//공지사항 전체 조회
	public List<Notice> selectNoticeList();

}
