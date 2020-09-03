package com.privateplaylist.www.student.wishlist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.student.wishlist.dao.WishlistDao;

import common.util.Paging;

@Service
public class WishlistServiceImpl implements WishlistService{
	
	@Autowired
	private WishlistDao wishlistDao;

	public Paging getPagingWishStu(int curPage, int userNo) {
		
		int totalCount = wishlistDao.getPagingWishStu(userNo);
//		System.out.println(totalCount);
		Paging paging = new Paging(totalCount, curPage);
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectWishStu(Paging paging, int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("userNo", userNo);
		
		return wishlistDao.selectWishStu(map);
	}

	@Override
	public int deleteWishlist(int wishNo) {
		return wishlistDao.deleteWishlist(wishNo);
	}

	@Override
	public int insertConnLesson(int lessonNo, int studentNo, int teacherNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("lessonNo", lessonNo);
		map.put("studentNo", studentNo);
		map.put("teacherNo", teacherNo);
		
		return wishlistDao.insertConnLesson(map);
	}

	@Override
	public int checkalreadysign(int lessonNo, int studentNo, int teacherNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("lessonNo", lessonNo);
		map.put("studentNo", studentNo);
		map.put("teacherNo", teacherNo);
		
		return wishlistDao.checkalreadysign(map);
	}

}
