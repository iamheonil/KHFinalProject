package com.privateplaylist.www.teacher.profile.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.TeacherFile;
import com.privateplaylist.www.member.vo.Member;

@Repository
public class ProfileDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	//선생님 개인정보 update
	public int updateProfile(Member member) {
		return sqlSession.update("Profile.updateProfile",member);
	}

	//선생님 프로필 사진 insert
	public int insertFile(TeacherFile teacherFile) {
		return sqlSession.insert("Profile.insertFile",teacherFile);
	}

	//바뀐 디비값 가지고 오기
	public Member selectonenew(Member loginUser) {
		return sqlSession.selectOne("Profile.selectonenew",loginUser);
	}

	//사진 가지고 오기
	public TeacherFile selectFile(Member loginUser) {
		return sqlSession.selectOne("Profile.selectFile",loginUser);
	}

	//insert 전에 기존 사진 지우기 
	public int deleteFile(int userNo) {
		return sqlSession.delete("Profile.deleteFile",userNo);
	}

	//연결되 과외 개수 
	public int countIsEnd(int userNo) {
		return sqlSession.selectOne("Profile.countIsEnd",userNo);
	}

	//회원 탈퇴
	public int deleteProfile(int userNo) {
		return sqlSession.update("Profile.deleteProfile",userNo);
	}



	
	
	

}
