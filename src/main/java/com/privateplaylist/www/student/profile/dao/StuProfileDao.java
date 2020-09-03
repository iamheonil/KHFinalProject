package com.privateplaylist.www.student.profile.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//이인주 : 학생 마이페이지  > 개인정보 수정  dao

@Repository
public class StuProfileDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	//연결된 과외 개수
	public int countIsEnd(int userNo) {
		return sqlSession.selectOne("StuProfile.countIsEnd",userNo);
	}

}
