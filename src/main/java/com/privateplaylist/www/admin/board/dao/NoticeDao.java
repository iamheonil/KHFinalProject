package com.privateplaylist.www.admin.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Notice;

@Repository
public interface NoticeDao {

	//공지사항 전체 조회
	public List<Notice> selectNoticeList();

}
