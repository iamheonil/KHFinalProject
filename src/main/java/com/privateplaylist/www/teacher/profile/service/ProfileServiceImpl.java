package com.privateplaylist.www.teacher.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.dto.Membership;
import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.teacher.profile.dao.ProfileDao;

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
		System.out.println(">>>> loginuserPw"+loginuserPw);
		
		//사용자가 입력한 password  >> userPw
		
		//암호화  password
//		String secPw = "";
		
		// 암호화
//		secPw = passwordEncoder.encode(userPw);
//		System.out.println(">>>> secPw"+secPw);
		
		//결과
		int res = -1;
		
		// 암호화되지 않은 비밀번호(raw-)와 암호화된 비밀번호(encoded-)가 일치하는지 비교
//		　　boolean matches(CharSequence rawPassword, String encodedPassword);
		
		if( passwordEncoder.matches(userPw, loginuserPw) ) {
			res = 2;
		}else {
			res = 0;
		}
		
		System.out.println(">>>> res"+res);	
		return res;
	}

}
