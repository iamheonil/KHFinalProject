package com.privateplaylist.www.user.lesson.findStudent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.user.lesson.findStudent.dao.UserFindStuDao;

@Service
public class UserFindStuServiceImpl implements UserFindStuService{

	@Autowired
	UserFindStuDao userFindStuDao;
}
