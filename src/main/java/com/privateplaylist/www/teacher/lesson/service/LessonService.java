package com.privateplaylist.www.teacher.lesson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.FindLesson;
import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.lesson.dao.LessonDao;

import common.exception.FileException;
import common.util.FileUtil;
import common.util.Paging;

@Service
public class LessonService {
	
	@Autowired
	LessonDao lessonDao;
	
	/*
	 * 과외 등록 폼 작성한거 DB에 저장
	 */
	public int insertLesson(FindLesson findLesson, List<MultipartFile> files, String root) throws FileException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = lessonDao.insertLesson(findLesson);
		
		if(!(files.size() == 1
				&& files.get(0).getOriginalFilename().equals(""))) {
				
				//파일업로드를 위해 FileUtil.fileUpload() 호출
				List<Map<String,String>> filedata 
					= new FileUtil().fileUpload(files, root);
				
				for(Map<String,String> f : filedata) {
					f.put("lessonNo",  Integer.toString(findLesson.getLessonNo()));
					f.put("userNo",  Integer.toString(findLesson.getUserNo()));
					lessonDao.insertFile(f);
				}
			}
		
		return result;
	}

	public Paging getPagingTchLesson(int curPage, int userNo) {
		
		int totalCount = lessonDao.getLessonListCnt(userNo);
		
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	public List<Map<String, Object>> selectLessonList(Paging paging, Member loginUser) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("paging", paging);
		map.put("loginUser", loginUser);
		
		List<Map<String, Object>> list = lessonDao.selectLessonList(map);
		
		
//		for( Map<String, Object> map : list) {
//			map.put("", map)
//		}
		
		return list;
	}

	public int deleteLesson(int lessonNo) {
		int res = lessonDao.deleteLesson(lessonNo);
		System.out.println("service - dao결과 :"+res);
		return res;
	}

	public void endlesson(int lessonNo) {
		
		lessonDao.endLesson(lessonNo);
		
	}

	public Map<String, Object> selectLessonByNo(int lessonNo) {
		return lessonDao.selectLessonByNo(lessonNo);
	}

	public Map<String, String> selectTchFile(int userNo) {
		
		Map<String,String> file = lessonDao.selectTeacherFile(userNo);
		
		return file;
	}

	public Paging getPagingPay(int curPage, int userNo) {
		int totalCount = lessonDao.getPayListCnt(userNo);
		
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	public List<Map<String, Object>> selectPayList(Paging paging, Member loginUser) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("paging", paging);
		map.put("loginUser", loginUser);
		
		List<Map<String, Object>> list = lessonDao.selectPayList(map);
		
//		for( Map<String, Object> map : list) {
//			map.put("", map)
//		}
		
		return list;
	}


	public void insertPayment(int lessonNo, Member loginUser) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("lesson", lessonNo);
		map.put("user", loginUser.getUserNo());
		
		lessonDao.insertPayment(map);
	}

	public void updatePayState(int lessonNo) {
		lessonDao.updatePayState(lessonNo);
	}



}
