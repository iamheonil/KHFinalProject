package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

public interface BlackListService {

	/*
	 * 전체 신고내역
	 */
	public List<Map<String, Object>> selectAllBlackList();

}