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
	
	//페이징 처리를 위한 게시물의 수 가져오기
	public Paging getPaging(Map<String, Object> option, int curp) {
		int totalCount=fld.selectTotalCnt(option);
		
		
		Paging paging=new Paging(totalCount,curp,8);
		return paging;
	}

	//페이징 처리를 한 게시물리스트 가져오기
	public List<Map<String, Object>> selectFindLessonList(Map<String, Object> optionMap) {
		// TODO Auto-generated method stub
		return fld.selectByOption(optionMap);
	}
	
	//과외에 대한 리뷰와 별점 반환
	public List<Map<String,Object>> selectStarAndReview(){
		return fld.selectStarAndReview();
	}
	
	

}
