package com.privateplaylist.www.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindLessonDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//페이징을 위한 게시물의 수 반환
	public int selectTotalCnt(Map<String, Object> option) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberFindLesson.selectTotalCnt",option);
	}

	//페이징 처리를 한 게시물 가져오기
	public List<Map<String, Object>> selectByOption(Map<String, Object> optionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MemberFindLesson.selectByOption",optionMap);
	}
	
	public List<Map<String,Object>> selectStarAndReview(){
		return sqlSession.selectList("MemberFindLesson.selectStarAndReview");
	}
	



}
