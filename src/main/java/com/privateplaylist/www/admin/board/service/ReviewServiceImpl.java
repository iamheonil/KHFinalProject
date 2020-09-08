package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.ReviewDao;
import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<Map<String, Object>> selectReviewList(Paging paging) {
		List<Map<String, Object>> reviewList = reviewDao.selectReviewList(paging);
		return reviewList;
	}

	@Override
	public Paging reviewListPaging(HttpServletRequest req) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//테이블의 총 게시글 수를 조회한다
		int totalCount = reviewDao.selectCntReviewAll();
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	@Override
	public int deleteReview(int reviewNo) {
		
		int res = reviewDao.deleteReview(reviewNo);
		
		
		return res;
	}

	@Override
	public Paging reviewSearchPaging(HttpServletRequest req, String keyword) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//classbooking 테이블의 총 게시글 수를 조회한다
		int totalCount = reviewDao.selectCntReviewSearchAll(keyword);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	@Override
	public List<Review> selectSearchReview(Map<String, Object> searchMap) {
		List<Review> reviewList = reviewDao.selectSearchReview(searchMap);
		return reviewList;
	}
	
}
