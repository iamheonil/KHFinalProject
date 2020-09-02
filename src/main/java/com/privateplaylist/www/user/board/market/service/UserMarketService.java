package com.privateplaylist.www.user.board.market.service;

import java.util.Map;

import com.privateplaylist.www.dto.Market;

public interface UserMarketService {

	/**
	 * 로그인한 유저가 작성자인지 확인
	 * @return
	 */
	public boolean compareUserWriter();

	/**
	 * 중고장터 상세정보
	 * @param mkNo 
	 * @return
	 */
	public Market getMarketInfo(int mkNo);

}
