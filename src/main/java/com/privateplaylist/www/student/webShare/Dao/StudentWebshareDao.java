package com.privateplaylist.www.student.webShare.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.dto.Webshare;

import common.util.Paging;

@Repository
public class StudentWebshareDao {
	

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	//연결된 과외 조회
	public List<Map<String, Object>> selectConnectedLesson(int teaNo) {
		
		return sqlSession.selectList("StudentWebShare.selectConnectedLesson", teaNo);
	}

	
	//연결된 과외 번호의 자료실 조회
	public List<Map<String, Object>> selectWebShareList(int no, Paging paging) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("no", no);
		map.put("paging", paging);
		
		return sqlSession.selectList("StudentWebShare.selectWebShareList", map);
	}
	
	
	//연결된 과외 번호의 자료실 첨부파일 여부 조회
	public int checkWebShareFile(int sno) {
		
		return sqlSession.selectOne("StudentWebShare.checkWebShareFile", sno);
	}
	

	//자료실 목록에서 체크된 글 지우기
	public int deleteWebShare(int shareNo) {
		
		return sqlSession.delete("StudentWebShare.deleteWebShare", shareNo);
	}


	//자료실 글 등록
	public int insertWebShare(Webshare webShare) {
		
		return sqlSession.insert("StudentWebShare.insertWebShare", webShare);
	}

	
	//자료실 파일 등록
	public int insertWebShareFile(Map<String, String> fileInfo) {
		
		return sqlSession.insert("StudentWebShare.insertWebShareFile", fileInfo);
	}

	
	//자료실 글 상세보기
	public Webshare selectWebShareDetail(int no) {
		
		return sqlSession.selectOne("StudentWebShare.selectWebShareDetail", no);
	}

	
	//자료실 글에 달린 파일 정보
	public List<Map<String, Object>> selectWebShareFile(int no) {
		
		return sqlSession.selectList("StudentWebShare.selectWebShareFile", no);
	}


	//자료실 게시글 수 조회 - 페이징
	public int selectCntWebShare(int no) {

		return sqlSession.selectOne("StudentWebShare.selectCntWebShare", no);
	}


	//자료실 검색 후 게시글 수 조회 - 페이징
	public int selectCntWebShareSearch(String keyword, int no) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("no", no);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("StudentWebShare.selectCntWebShareSearch", map);
	}


	//자료실 검색 - 검색된 글들만 출력
	public List<Map<String, Object>> selectSearchWebShare(Map<String, Object> searchMap) {
		
		return sqlSession.selectList("StudentWebShare.selectSearchWebShare", searchMap);
	}


	public Membership selectStudentByNo(int studentNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("StudentWebShare.selectStudentByNo", studentNo);
	}



}
