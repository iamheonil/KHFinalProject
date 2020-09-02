package com.privateplaylist.www.student.market.service;

import java.util.List;
import java.util.Map;

import common.util.Paging;

public interface MarketStuService {

	/**
	 * 마켓 페이징
	 * @param curPage
	 * @param userNo
	 * @return
	 */
	public Paging getPagingMarketStu(int curPage, int userNo);

	/**
	 * 마켓 내가 쓴글 리스트
	 * @param paging
	 * @param userNo
	 * @return
	 */
	public List<Map<String, Object>> selectMarketStu(Paging paging, int userNo);

}
