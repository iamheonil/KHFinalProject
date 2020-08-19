package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.BlackListDao;

@Service
public class BlackListServiceImpl implements BlackListService {

	@Autowired
	private BlackListDao blackListDao;
	
	@Override
	public List<Map<String, Object>> selectAllBlackList() {
		List<Map<String, Object>> list = blackListDao.selectAllBlackList();
		
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

}
