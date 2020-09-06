package com.privateplaylist.www.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.board.dao.NoticeDao;
import com.privateplaylist.www.dto.Notice;

import common.util.Paging;

//이인주 : 관리자 공지사항 NoticeServiceImpl

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<Notice> selectNoticeList(Paging paging) {
		List<Notice> noticeList = noticeDao.selectNoticeList(paging);
		return noticeList;
	}
	
	@Override
	public Notice selectNoticeone(int noticeNo) {
		Notice noticeone = noticeDao.selectNoticeone(noticeNo);
		return noticeone;
	}
	
	@Override
	public int insertNotice(Notice notice) {
		int res = noticeDao.insertNotice(notice);
		return res;
	}
	
	@Override
	public int updateNotice(Notice notice) {
		int res = noticeDao.updateNotice(notice);
		return res;
	}
	
	@Override
	public int deleteNotice(int noticeNo) {
		int res = noticeDao.deleteNotice(noticeNo);
		return res;
	}
	
	@Override
	public List<Notice> selectSearchNotice(Map<String, Object> searchMap) {
		List<Notice> noticeList = noticeDao.selectSearchNotice(searchMap);
		return noticeList;
	}
	
	@Override
	public Paging noticeListPaging(HttpServletRequest req) {
			
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//classbooking 테이블의 총 게시글 수를 조회한다
		int totalCount = noticeDao.selectCntNoticeAll();
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
	@Override
	public Paging noticeSearchPaging(HttpServletRequest req, String keyword) {
		//전달 파라미터  curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0 ;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//classbooking 테이블의 총 게시글 수를 조회한다
		int totalCount = noticeDao.selectCntNoticeSearchAll(keyword);
		
		//paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}
	
}
