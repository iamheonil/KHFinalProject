package com.privateplaylist.www.teacher.profile.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.dto.TeacherFile;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.profile.dao.ProfileDao;

import common.util.FileUtilProfile;

//이인주 : 선생님 마이페이지  > 개인정보 수정 > serviceImpl

@Service
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	ProfileDao profileDao;
	
	@Override
	public int chkpassword(Member loginUser, String userPw) {
		
		//세션의 비밀번호
		String loginuserPw = loginUser.getUserPw();
//		System.out.println(">>>> loginuserPw"+loginuserPw);
		
		//사용자가 입력한 password  >> userPw
		
		//결과
		int res = -1;
		
		// 암호화되지 않은 비밀번호(raw-)와 암호화된 비밀번호(encoded-)가 일치하는지 비교
//		　　boolean matches(CharSequence rawPassword, String encodedPassword);
		
		if( passwordEncoder.matches(userPw, loginuserPw) ) {
			res = 2;
		}else {
			res = 0;
		}
		
//		System.out.println(">>>> res"+res);	
		return res;
	}
	
	@Override
	public int updateProfile(Member member, MultipartFile file, String root, Member loginUser,TeacherFile teacherFile) {
		
		//개인정보 결과
		int result1 = 0;
		
		//사진 insert 결과 
		int result2 = 0;
		
		//update 할 개인정보  
		
		//userNo 추가
		int userNo = loginUser.getUserNo();
		member.setUserNo(userNo);
		
		//입력한 password
		String password = member.getUserPw();
		if(password.equals("")) {
			//개인정보 update
			result1 = profileDao.updateProfile(member);
		}else {
			//암호화할 password
			String secPw = "";
		
			//비밀번호 암호화
			secPw = passwordEncoder.encode(password);
			
			//비밀번호 set
			member.setUserPw(secPw);
			
			//개인정보 update
			result1 = profileDao.updateProfile(member);
		}
	
		//새로운 파일이 있음
		if(file != null) {
			
			//파일 insert
			if(file.getSize() != 1 && !file.getOriginalFilename().equals("")) {
				
				//기존 파일이 있으면 삭제 
				if(teacherFile != null) {
					int delres = profileDao.deleteFile(userNo);
				}
				
				//파일 업로드를 위해 FileUtil.fileUpload() 호출
				Map<String, Object> filedata = new FileUtilProfile().fileUpload(file,root);
				
				//db에 넣을 teacherFile
				TeacherFile inteacherFile = new TeacherFile();
				
				inteacherFile.setUserNo(userNo);
				inteacherFile.setUserId(loginUser.getUserId());
				inteacherFile.setTchFileOrg((String) filedata.get("originFileName"));
				inteacherFile.setTchFileRename((String) filedata.get("renameFileName"));
				inteacherFile.setSavePath((String)filedata.get("savePath"));
				
//				System.out.println("teacherFile"+teacherFile);
				
				//프로필 사진 insert
				result2 = profileDao.insertFile(inteacherFile);
				
		}
			
			return result1+result2;
			
		}else {
			return result1;
		}
		
		
	}
	
	@Override
	public Member selectonenew(Member loginUser) {
		return profileDao.selectonenew(loginUser);
	}
	
	@Override
	public TeacherFile selectFile(Member loginUser) {
		return profileDao.selectFile(loginUser);
	}
	
	@Override
	public int countIsEnd(int userNo) {
		return profileDao.countIsEnd(userNo);
	}
	
	@Override
	public int deleteProfile(int userNo) {
		return profileDao.deleteProfile(userNo);
	}

}
