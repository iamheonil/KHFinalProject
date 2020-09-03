package com.privateplaylist.www.student.findStu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.FindStudent;

@Repository
public class FindStuDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//학생 찾기 list
	public List<FindStudent> findStuList(Map<Object, Object> findStuMap) {
		return sqlSession.selectList("FindStu.findStuList",findStuMap);
	}

	//총 게시글 수 조회
	public int selectCntFindStuAll(int userNo) {
		return sqlSession.selectOne("FindStu.selectCntFindStuAll",userNo);
	}

	//검색 페이징
	public int findStuSearchPaging(Map<Object, Object> findStuPagingMap) {
		return sqlSession.selectOne("FindStu.findStuSearchPaging",findStuPagingMap);
	}

	//학생 검색 list
	public List<FindStudent> findStuSearch(Map<Object, Object> findStuSearchMap) {
		return sqlSession.selectList("FindStu.findStuSearch",findStuSearchMap);
	}

	//삭제
	public int deleteFindStu(int findStuNo) {
		return sqlSession.delete("FindStu.deleteFindStu",findStuNo);
	}

	//insert
	public int insertFindStu(FindStudent findStudent) {
		return sqlSession.insert("FindStu.insertFindStu",findStudent);
	}

	public int updateState(FindStudent findStudent) {
		return sqlSession.update("FindStu.updateState",findStudent);
	}
}
