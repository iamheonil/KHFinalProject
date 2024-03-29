package com.privateplaylist.www.teacher.blackLIst.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.blackLIst.dao.TeacherBlackListDao;

import common.util.Paging;

@Service
public class TeacherBlackListService {

	@Autowired
	TeacherBlackListDao blackListDao;


	public List<Map<String, Object>> selectAllBlackList(Paging paging, String category) {

		Map<String, Object> bMap = new HashMap<>();

		bMap.put("category", category);
		bMap.put("paging", paging);

		List<Map<String, Object>> list = blackListDao.selectAllBlackList(bMap);
		System.out.println(list);

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


	public Paging getPagingBlack(int curPage, String category, String search) {
		System.out.println(search);

		Map<String, String> map = new HashMap<>();

		map.put("category", category);
		map.put("search", search);

		int totalCount = blackListDao.selectCntAllBlack(map);

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		paging.setSearch(search);
		return paging;
	}



	public void turndownReview(List<Integer> list) {

		for( int no : list ) {
			blackListDao.updateBlacklistTurndown(no);
		}

	}


	public void deleteReview(List<Integer> list) {

		for( int no : list ) {
			int reviewNo = blackListDao.selectReviewByBN(no);
			blackListDao.updateBlackReivewDelete(reviewNo);
			blackListDao.deleteReview(reviewNo);
		}

	}


	public int selectReportCnt() {
		return blackListDao.selectReportCnt();
	}


	public void turndownMarket(List<Integer> mList) {

		for( int no : mList ) {
			blackListDao.updateBlacklistTurndown(no);
		}

	}


	public void deleteMarket(List<Integer> mList) {

		for( int no : mList ) {
			int marketNo = blackListDao.selectMarketByBN(no);
			blackListDao.updateBlackMarketDelete(marketNo);
			blackListDao.deleteMarket(marketNo);
		}		
	}


	public int selectCnt(String userNo) {
		Map<String, String> map = new HashMap<>();


		map.put("search", userNo);

		int totalCount = blackListDao.selectCntAllBlack(map);

		
		return totalCount;
	}

}
