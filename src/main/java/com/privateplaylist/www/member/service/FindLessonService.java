package com.privateplaylist.www.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.member.dao.FindLessonDao;

import common.util.Paging;

@Service
public class FindLessonService {
	
	@Autowired
	FindLessonDao fld;

	public Paging getPaging(Map<String, Object> option, int curp) {
		int totalCount=fld.selectTotalCnt(option);
		
		
		Paging paging=new Paging(totalCount,curp);
		return paging;
	}

	public List<Map<String, Object>> selectFindLessonList(Map<String, Object> optionMap) {
		// TODO Auto-generated method stub
		return fld.selectByOption(optionMap);
	}
	
	

}
