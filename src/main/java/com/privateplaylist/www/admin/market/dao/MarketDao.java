package com.privateplaylist.www.admin.market.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.Paging;

@Repository
public class MarketDao {

	@Autowired
	SqlSessionTemplate sqlsession;

	//중고장터 게시물의 수를 불러옴
	public int marketCnt(String search) {
		return sqlsession.selectOne("AdminMarket.selectMarketCntAll",search);
	}

	//사용자 id를 검색한 게시물의 수를 가져옴
	public int marketCntById(String userId) {
		return sqlsession.selectOne("AdminMarket.selectMarketCntByUserId",userId);
	}

	//장터 제목 게시물의 수를 가져옴
	public int marketCntByTitle(String title) {
		return sqlsession.selectOne("AdminMarket.selectMarketCntByTitle",title);
	}

	//중고장터 게시물의 리스트를 불러옴
	public List<Map<String,Object>> getMarketList(Map<String,Object> pMap){
		return sqlsession.selectList("AdminMarket.selectMarketList",pMap);
	}

	//중고장터 게시물의 리스트를 불러옴
	public List<Map<String,Object>> getMarketListById(Map<String,Object> pMap){
		return sqlsession.selectList("AdminMarket.selectMarketListById",pMap);
	}

	//중고장터 게시물의 리스트를 불러옴
	public List<Map<String,Object>> getMarketListByTitle(Map<String,Object> pMap){
		return sqlsession.selectList("AdminMarket.selectMarketListByTitle",pMap);
	}

	//중고장터의 게시물을 삭제
	public int deleteMarket(int mkNo) {
		return sqlsession.delete("AdminMarket.deleteMarket", mkNo);
	}

	//중고장터의 게시물을 삭제
	public int deleteMarketFile(int mkNo) {
		return sqlsession.delete("AdminMarket.deleteMarketFile", mkNo);
	}

	//중고장터의 게시물을 삭제
	public int deleteMarketThumb(int mkNo) {
		return sqlsession.delete("AdminMarket.deleteMarketThumb", mkNo);
	}

}
