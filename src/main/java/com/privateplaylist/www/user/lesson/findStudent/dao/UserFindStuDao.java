package com.privateplaylist.www.user.lesson.findStudent.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//20200904 이인주 : user > find_student > Dao

@Repository
public class UserFindStuDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

}
