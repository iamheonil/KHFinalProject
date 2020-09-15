package com.privateplaylist.www.student.lesson.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StuApplyLessonDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectApplyListCnt(int userNo) {
		return sqlSession.selectOne("StuApply.selectApplyListCnt", userNo);
	}

	public List<Map<String, Object>> selectApplyList(Map<String, Object> map) {
		return sqlSession.selectList("StuApply.selectApplyList", map);
	}

	public Map<String, Object> selectTeacherByNo(int teacherNo) {
		return sqlSession.selectOne("StuApply.selectTeacherByNo", teacherNo);
	}

	public int cancelApplyByNo(int connLessonNo) {
		return sqlSession.delete("StuApply.cancelApplyByNo", connLessonNo);
	}

}
