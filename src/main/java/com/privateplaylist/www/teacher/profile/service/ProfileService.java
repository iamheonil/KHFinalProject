package com.privateplaylist.www.teacher.profile.service;

import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.TeacherFile;
import com.privateplaylist.www.member.vo.Member;

//이인주 : 선생님 마이페이지  > 개인정보 수정 > service

public interface ProfileService {

	//비밀번호 일치 확인
	public int chkpassword(Member loginUser, String userPw);

	//개인정보 update + 파일 insert
	public int updateProfile(Member member, MultipartFile file, String root, Member loginUser, TeacherFile teacherFile);

	//바뀐 디비값 가지고 오기
	public Member selectonenew(Member loginUser);

	//사진 가지고 오기
	public TeacherFile selectFile(Member loginUser);

	//연결된 과외 개수 
	public int countIsEnd(int userNo);

	//회원 탈퇴
	public int deleteProfile(int userNo);

}
