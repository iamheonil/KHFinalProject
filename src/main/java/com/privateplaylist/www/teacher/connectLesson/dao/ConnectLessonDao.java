package com.privateplaylist.www.teacher.connectLesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Membership;

import common.util.Paging;

@Repository
public class ConnectLessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "dao.ConnectLessonDao.";
	
	public List<Map<String, Object>> selectConnectStu(Map<String, Object> map) {
		return sqlSession.selectList(namespace + "selectConnectStu", map);
	}

	public int selectCntAllStu(int userNo) {
		return sqlSession.selectOne(namespace + "selectCntAllStu", userNo);
	}

	public int updateConnState(int connNo) {
		return sqlSession.update(namespace + "updateConnState", connNo);
	}

	public int rejectSignStu(int connNo) {
		return sqlSession.delete(namespace + "rejectSignStu", connNo);
	}

	public Map<String, Integer> getMaxPeople(int connNo) {
		return sqlSession.selectOne(namespace + "getMaxPeople", connNo);
	}

	public int getConnectedCnt(int lessonNo) {
		int no = sqlSession.selectOne(namespace + "getConnectedCnt", lessonNo);
		return no;
	}

	public FindLesson selectLessonByNo(int lessonNo) {
		return sqlSession.selectOne(namespace + "selectLessonByNo", lessonNo);
	}

	public Membership selectStudentByNo(int studentNo) {
		return sqlSession.selectOne(namespace + "selectStudentByNo", studentNo);
	}

}
