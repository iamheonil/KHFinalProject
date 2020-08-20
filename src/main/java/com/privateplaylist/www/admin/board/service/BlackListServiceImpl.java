package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.BlackListDao;

import common.util.Paging;

@Service
public class BlackListServiceImpl implements BlackListService {

	@Autowired
	private BlackListDao blackListDao;
	
	@Override
	public List<Map<String, Object>> selectAllBlackList(Paging paging) {
		List<Map<String, Object>> list = blackListDao.selectAllBlackList(paging);
		
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
	public Paging getPagingBlack(int curPage) {
		
		int totalCount = blackListDao.selectCntAllBlack();
		
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		System.out.println(paging);
		return paging;
	}


	@Override
	public void turndown(HttpServletRequest req) {
		String[] arr = req.getParameterValues("checkRow");
		
		for( String no : arr ) {
			if( no!=null && !"".equals(no)) {
				int blacklistNo = Integer.parseInt(no);
				blackListDao.updateBlacklistTurndown(blacklistNo);
			}
			
		}
		
	}

	@Override
	public void deleteReview(HttpServletRequest req) {
		
		String[] arr = req.getParameterValues("checkRow");
		
		for( String no : arr ) {
			if( no!=null && !"".equals(no)) {
				int blacklistNo = Integer.parseInt(no);
				blackListDao.updateBlacklistDelete(blacklistNo);
				int reviewNo = blackListDao.selectReviewByBN(blacklistNo);
				blackListDao.deleteReview(reviewNo);
			}
			
		}
		
	}

}