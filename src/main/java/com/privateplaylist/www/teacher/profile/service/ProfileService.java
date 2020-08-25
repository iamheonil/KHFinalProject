package com.privateplaylist.www.teacher.profile.service;

import com.privateplaylist.www.member.vo.Member;

public interface ProfileService {

	//비밀번호 일치 확인
	public int chkpassword(Member loginUser, String userPw);

}
