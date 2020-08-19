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
	public int marketCnt() {
		return marketDao.marketCnt();
	}
	
	public Map<String,Object> allMarketList(int curPage){
		//리턴할 map을 선언
		Map<String,Object> cMap=new HashMap<String, Object>();
		
		//한페이지에 10개씩 보여주는 페이징 처리할것
		Paging p=new Paging(marketDao.marketCnt(),curPage,10);
		
		//마켓 리스트를 가져옴
		List<Map<String,Object>> mList=marketDao.getMarketList(p);
		for(int j=0;j<mList.size();j++) {
			
			for(int i=j+1;i<mList.size();i++) {
				if(mList.get(i).get("MK_NO")== mList.get(j).get("MK_NO")) {
					mList.remove(i);
					
				}
			}
		}
		
		for (Map<String, Object> map : mList) {
			System.out.println(map);
			
		}
		
		cMap.put("mPage", p);
		cMap.put("mList", mList);
		
		return cMap;
	}
	
	

}
