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
	
	//전체 리뷰와 가져오기
	public List<Map<String,Object>> selectStarAndReview(){
		return sqlSession.selectList("MemberFindLesson.selectStarAndReview");
	}

	//상세페이지의 과외정보 가져오기
	public Map<String,Object> selectLessonByLessonNo(int lessonNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberFindLesson.selectLessonByLessonNo",lessonNo);
	}

	//상세페이지의 과외 사진 가져오기
	public List<Map<String, Object>> selectlessonFile(int lessonNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MemberFindLesson.selectlessonFile",lessonNo);
	}

	//상세페이지의 선생님 사진 가져오기
	public Map<String, Object> selectTeacherFile(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberFindLesson.selectTeacherFile",userNo);
	}

	//상세페이지의 리뷰와 후기 가져오기
	public List<Map<String, Object>> selectReviewByLessonNo(int lessonNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MemberFindLesson.selectReviewByLessonNo",lessonNo);
	}

	public int selectCntWish(Map<String, Object> comm) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MemberFindLesson.selectCntWish",comm);
	}

	public void insertWishList(Map<String, Object> comm) {
		sqlSession.insert("MemberFindLesson.insertWishList",comm);
		// TODO Auto-generated method stub
		
	}
	



}
