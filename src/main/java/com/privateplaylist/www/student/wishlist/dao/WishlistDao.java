package com.privateplaylist.www.student.wishlist.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishlistDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "dao.WishlistDao.";

	public int getPagingWishStu(int userNo) {
		return sqlSession.selectOne(namespace + "getPagingWishStu", userNo);
	}

	public List<Map<String, Object>> selectWishStu(Map<String, Object> map) {
		return sqlSession.selectList(namespace + "selectWishStu", map);
	}

	public int deleteWishlist(int wishNo) {
		return sqlSession.delete(namespace + "deleteWishlist", wishNo);
	}

	public int insertConnLesson(Map<String, Integer> map) {
		return sqlSession.insert(namespace + "insertConnLesson", map);
	}

	public int checkalreadysign(Map<String, Integer> map) {
		return sqlSession.selectOne(namespace + "checkalreadysign", map);
	}

}
