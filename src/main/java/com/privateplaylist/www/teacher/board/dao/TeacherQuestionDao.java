package com.privateplaylist.www.teacher.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Question;

import common.util.Paging;

@Repository
public class TeacherQuestionDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Question> selectQuestionList(Paging paging) {
		return sqlSession.selectList("TeacherQuestion.selectQuestionList",paging);
	}

	public int selectCntQuestionAll() {
		return sqlSession.selectOne("TeacherQuestion.selectCntQuestionAll");
	}

}
