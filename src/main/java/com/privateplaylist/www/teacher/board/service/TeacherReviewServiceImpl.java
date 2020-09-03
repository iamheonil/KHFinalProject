package com.privateplaylist.www.teacher.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Question;
import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.teacher.board.dao.TeacherQuestionDao;
import com.privateplaylist.www.teacher.board.dao.TeacherReviewDao;

import common.util.Paging;

@Service
public class TeacherReviewServiceImpl implements TeacherReviewService{

	@Autowired
	private TeacherReviewDao teacherReviewDao;
	
	
	@Override
	public List<Review> selectReviewList(Paging paging) {
		List<Review> reviewList = teacherReviewDao.selectReviewList(paging);
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
				int totalCount = teacherReviewDao.selectCntReviewAll();
				
				//paging객체 생성
				Paging paging = new Paging(totalCount, curPage);
				
				//계산된 Paging 객체 반환
				return paging;
	}

	

	@Override
	public List<Review> selectSearchReview(Map<String, Object> searchMap) {
		List<Review> reviewList = teacherReviewDao.selectSearchReview(searchMap);
		return reviewList;
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
				int totalCount = teacherReviewDao.selectCntReviewSearchAll(keyword);
				
				//paging객체 생성
				Paging paging = new Paging(totalCount, curPage);
				
				//계산된 Paging 객체 반환
				return paging;
	}

}
