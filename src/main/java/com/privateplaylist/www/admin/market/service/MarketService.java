package com.privateplaylist.www.admin.market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.market.dao.MarketDao;

import common.util.Paging;

@Service
public class MarketService {

	@Autowired
	MarketDao marketDao;

	//중고장터게시물의 수를 반환
	public int marketCnt(String search) {
		return marketDao.marketCnt(search);
	}


	//중고장터의 리스트를 가져옴 & 페이징 처리 & 검색처리
	public Map<String,Object> allMarketList(int curPage,String option,String search){

		//리턴할 map을 선언
		Map<String,Object> cMap=new HashMap<String, Object>();
		Map<String,Object> pMap=new HashMap<String,Object>();
		Paging p;
		
		
		
		if(option.equals("전체")|| option=="전체" || option==null ||option==""||option.equals("")) {//검색옵션이 전체일때
			
			if(search==null ||search.equals(null)) {
				search="";
			}
			int tcnt=marketDao.marketCnt(search);
			
			//한페이지에 10개씩 보여주는 페이징 처리할것
			p=new Paging(tcnt,curPage,10);//전체검색
			
			
			
			pMap.put("startNO",p.getStartNo());
			pMap.put("endNo",p.getEndNo());
			pMap.put("search",search);

			List<Map<String,Object>> mList=marketDao.getMarketList(pMap);
			cMap.put("mPage", p);
			cMap.put("mList", mList);

		}else if(option.equals("사용자id") || option=="사용자id") {//검색옵션이 사용자id일때
			if(search==null) {
				search="";
			}
			int tcnt=marketDao.marketCntById(search);
			
			//한페이지에 10개씩 보여주는 페이징 처리할것
			p=new Paging(tcnt,curPage,10);
			
			pMap.put("startNO",p.getStartNo());
			pMap.put("endNo",p.getEndNo());
			pMap.put("search",search);
			List<Map<String,Object>> mList=marketDao.getMarketListById(pMap);
			cMap.put("mPage", p);
			cMap.put("mList", mList);
		}

		else {//검색옵션이 title일때
			
			if(search==null) {
				search="";
			}
			
			int tcnt=marketDao.marketCntByTitle(search);
			
			p=new Paging(tcnt,curPage,10);
			
			pMap.put("startNO",p.getStartNo());
			pMap.put("endNo",p.getEndNo());
			pMap.put("search",search);
			
			List<Map<String,Object>> mList=marketDao.getMarketListByTitle(pMap);
			cMap.put("mPage", p);
			cMap.put("mList", mList);

		}


		

		return cMap;
	}

	public int deleteMarket(int mkNo) {

		//market테이블과 연관된 테이블 데이터 삭제
		marketDao.deleteMarketFile(mkNo);
		marketDao.deleteMarketThumb(mkNo);


		return marketDao.deleteMarket(mkNo);
	}



}
