package com.privateplaylist.www.admin.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.BlackListDao;

import common.util.Paging;

@Service
public class BlackListServiceImpl implements BlackListService {

	@Autowired
	private BlackListDao blackListDao;
	
	@Override
	public List<Map<String, Object>> selectAllBlackList(Paging paging, String category) {
		
		Map<String, Object> bMap = new HashMap<>();
		
		bMap.put("category", category);
		bMap.put("paging", paging);
		
		List<Map<String, Object>> list = blackListDao.selectAllBlackList(bMap);
		
		for( Map<String, Object> map : list) {
			
			if( Integer.parseInt(String.valueOf(map.get("BLACKLIST_STATE"))) == 0 ) {
				map.put("BLACKLIST_STATE", "신고됨");
				
			}else if(Integer.parseInt(String.valueOf(map.get("BLACKLIST_STATE"))) == 1) {
				map.put("BLACKLIST_STATE", "삭제됨");
				
			}else if(Integer.parseInt(String.valueOf(map.get("BLACKLIST_STATE"))) == 2) {
				map.put("BLACKLIST_STATE", "반려됨");
				
			}
		}
		
		return list;
	}

	@Override
	public Paging getPagingBlack(int curPage, String category, String search) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("category", category);
		map.put("search", search);
		
		int totalCount = blackListDao.selectCntAllBlack(map);
		
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		paging.setSearch(search);
		return paging;
	}


	@Override
	public void turndownReview(List<Integer> list) {
		
		for( int no : list ) {
			blackListDao.updateBlacklistTurndown(no);
		}
		
	}

	@Override
	public void deleteReview(List<Integer> list) {
		
		for( int no : list ) {
			int reviewNo = blackListDao.selectReviewByBN(no);
			blackListDao.updateBlackReivewDelete(reviewNo);
			blackListDao.deleteReview(reviewNo);
		}
		
	}

	@Override
	public int selectReportCnt() {
		return blackListDao.selectReportCnt();
	}

	@Override
	public void turndownMarket(List<Integer> mList) {
		
		for( int no : mList ) {
			blackListDao.updateBlacklistTurndown(no);
		}
		
	}

	@Override
	public void deleteMarket(List<Integer> mList) {
		
		for( int no : mList ) {
			int marketNo = blackListDao.selectMarketByBN(no);
			blackListDao.updateBlackMarketDelete(marketNo);
			blackListDao.deleteMarket(marketNo);
		}		
	}

}