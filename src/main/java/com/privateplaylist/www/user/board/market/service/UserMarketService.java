package com.privateplaylist.www.user.board.market.service;

import java.util.List;
import java.util.Map;

import com.privateplaylist.www.dto.MkFile;

import common.util.Paging;

public interface UserMarketService {

	/**
	 * 중고장터 상세정보
	 * @param mkNo 
	 * @return
	 */
	public Map<String, Object> getMarketInfo(int mkNo);

	/**
	 * 중고장터 사진
	 * @param mkno
	 * @return
	 */
	public List<MkFile> getMarketFile(int mkno);

	/**
	 * 중고장터 리스트
	 * @param paging 
	 * @return
	 */
	public List<Map<String, Object>> getMarketlist(Paging paging);

	/**
	 * 중고장터 리스트 페이징
	 * @param curPage 
	 * @param search 
	 * @return
	 */
	public Paging getPagingMkList(int curPage, String search);

}
