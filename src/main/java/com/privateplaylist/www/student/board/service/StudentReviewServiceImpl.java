package com.privateplaylist.www.student.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.board.dao.StudentReviewDao;

import common.util.Paging;

@Service
public class StudentReviewServiceImpl implements StudentReviewService{

	@Autowired
	private StudentReviewDao studentReviewDao;

	@Override
	public Paging getPagingStuReview(int curPage, Member loginUser) {
		int totalCount = studentReviewDao.selectReviewListCnt(loginUser.getUserNo());

		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Review> selectReviewList(Paging paging, Member loginUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("user", loginUser);
		
		List<Review> reviewList = studentReviewDao.selectReviewList(map);
		
		return reviewList;
	}

	
	
	
}
