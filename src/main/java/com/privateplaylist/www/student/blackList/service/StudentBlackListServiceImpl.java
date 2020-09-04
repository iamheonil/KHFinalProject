package com.privateplaylist.www.student.blackList.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.student.blackList.dao.StudentBlackListDao;

import common.util.Paging;

@Service
public class StudentBlackListServiceImpl implements StudentBlackListService {

	
	@Autowired
	StudentBlackListDao studentBlackListDao;
	
	
	//페이징
	@Override
	public Paging getPagingBlack(int curPage, String category, String search) {
		
//		System.out.println(search);

		Map<String, String> map = new HashMap<>();

		map.put("category", category);
		map.put("search", search);

		int totalCount = studentBlackListDao.selectCntAllBlack(map);

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		paging.setSearch(search);
		
		return paging;

	}

	//신고 글 목록
	@Override
	public List<Map<String, Object>> selectAllBlackList(Paging paging, String category) {
		
		Map<String, Object> bMap = new HashMap<>();

		bMap.put("category", category);
		bMap.put("paging", paging);

		List<Map<String, Object>> list = studentBlackListDao.selectAllBlackList(bMap);
		
//		System.out.println(list);

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


	//신고 수 
	@Override
	public int selectCnt(String userNo) {
		
		Map<String, String> map = new HashMap<>();

		map.put("search", userNo);

		int totalCount = studentBlackListDao.selectCntAllBlack(map);
		
		return totalCount;
	}
	
	
}
