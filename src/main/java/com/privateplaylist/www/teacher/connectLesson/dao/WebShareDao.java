package com.privateplaylist.www.teacher.connectLesson.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Webshare;

import common.util.Paging;

@Repository
public class WebShareDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	//연결된 과외 조회
	public List<Map<String, Object>> selectConnectedLesson(int teaNo) {
		
		return sqlSession.selectList("WebShare.selectConnectedLesson", teaNo);
	}

	
	//연결된 과외 번호의 자료실 조회
	public List<Map<String, Object>> selectWebShareList(int no, Paging paging) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("no", no);
		map.put("paging", paging);
		
		return sqlSession.selectList("WebShare.selectWebShareList", map);
	}
	
	
	//연결된 과외 번호의 자료실 첨부파일 여부 조회
	public int checkWebShareFile(int sno) {
		
		return sqlSession.selectOne("WebShare.checkWebShareFile", sno);
	}
	

	//자료실 목록에서 체크된 글 지우기
	public int deleteWebShare(int shareNo) {
		
		return sqlSession.delete("WebShare.deleteWebShare", shareNo);
	}


	//자료실 글 등록
	public int insertWebShare(Webshare webShare) {
		
		return sqlSession.insert("WebShare.insertWebShare", webShare);
	}

	
	//자료실 파일 등록
	public int insertWebShareFile(Map<String, String> fileInfo) {
		
		return sqlSession.insert("WebShare.insertWebShareFile", fileInfo);
	}

	
	//자료실 글 상세보기
	public Webshare selectWebShareDetail(int no) {
		
		return sqlSession.selectOne("WebShare.selectWebShareDetail", no);
	}

	
	//자료실 글에 달린 파일 정보
	public List<Map<String, Object>> selectWebShareFile(int no) {
		
		return sqlSession.selectList("WebShare.selectWebShareFile", no);
	}


	//자료실 게시글 수 조회 - 페이징
	public int selectCntWebShare(int no) {

		return sqlSession.selectOne("WebShare.selectCntWebShare", no);
	}


	

}
