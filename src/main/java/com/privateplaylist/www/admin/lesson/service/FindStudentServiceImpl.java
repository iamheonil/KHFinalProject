package com.privateplaylist.www.admin.lesson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.lesson.dao.FindStudentDao;

@Service
public class FindStudentServiceImpl implements FindStudentService{

	
	@Autowired
	FindStudentDao findStudentDao;
	
	
	//학생찾기 게시글 조회
	@Override
	public List<Map<String, Object>> selectFindStudent() {
		
		return findStudentDao.selectFindStudent();
	}

}
