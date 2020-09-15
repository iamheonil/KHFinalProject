package com.privateplaylist.www.student.lesson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.lesson.dao.StuApplyLessonDao;

import common.util.Paging;

@Service
public class StuApplyLessonService {
	
	@Autowired
	private StuApplyLessonDao stuApplyLessonDao;

	public Paging getPagingStuApply(int curPage, Member loginUser) {
		
		int totalCount = stuApplyLessonDao.selectApplyListCnt(loginUser.getUserNo());
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	public List<Map<String, Object>> selectApplyList(Paging paging, Member loginUser) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("user", loginUser);
		
		List<Map<String, Object>> applylist = stuApplyLessonDao.selectApplyList(map);
		
		return applylist;
	}

	public Map<String, Object> selectTeacherByNo(int teacherNo) {
		return stuApplyLessonDao.selectTeacherByNo(teacherNo);
	}

	public int cancelApplyByNo(int connLessonNo) {
		return stuApplyLessonDao.cancelApplyByNo(connLessonNo);
	}

}
