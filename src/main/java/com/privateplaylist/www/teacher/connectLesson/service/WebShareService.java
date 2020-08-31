package com.privateplaylist.www.teacher.connectLesson.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.Webshare;

import common.util.Paging;

public interface WebShareService {

	//연결된 과외 조회
	public List<Map<String, Object>> selectConnectedLesson(int teaNo);

	
	//연결된 과외 번호의 자료실 조회
	public List<Map<String, Object>> selectWebShareList(int no, Paging paging);
	

	//자료실 게시글 수 조회 - 페이징
	public Paging webShareListPaging(HttpServletRequest req, int no);

	
	//연결된 과외 번호의 자료실 첨부파일 여부 조회
	public int checkWebShareFile(int sno);
	
	
	//자료실 목록에서 체크된 글 지우기
	public int deleteWebShare(int shareNo);


	//자료실 글 등록
	public int insertWebShare(List<MultipartFile> files, String root, Webshare webShare);


	//자료실 글 상세보기
	public Map<String, Object> selectWebShareDetail(int no);


	//자료실 검색 - 페이징
	public Paging webShareSearchPaging(HttpServletRequest req, String keyword, int no);

	
	//자료실 검색 - 검색된 글들만 출력
	public List<Map<String, Object>> selectSearchWebShare(Map<String, Object> searchMap);



}
