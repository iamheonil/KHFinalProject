package com.privateplaylist.www.student.profile.service;

import com.privateplaylist.www.member.vo.Member;

//이인주 : 학생 마이페이지  > 개인정보 수정  service

public interface StuProfileService {

	//학생 개인정보 수정
	public int updateProfile(Member member, Member loginUser);

	//학생 연결된 과외 있는지 확인
	public int countIsEnd(int userNo);

	

}
