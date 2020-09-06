package com.privateplaylist.www.student.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.member.vo.Member;
import com.privateplaylist.www.student.profile.dao.StuProfileDao;
import com.privateplaylist.www.teacher.profile.dao.ProfileDao;

//이인주 : 학생 마이페이지  > 개인정보 수정  serviceImpl

@Service
public class StuProfileServiceImpl implements StuProfileService{
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	StuProfileDao sutProfileDao;
	
	@Autowired
	ProfileDao profileDao;
	
	@Override
	public int updateProfile(Member member, Member loginUser) {
		//개인정보 결과
		int result = 0;
		
		//update 할 개인정보  
		
		//userNo 추가
		int userNo = loginUser.getUserNo();
		member.setUserNo(userNo);
		
		//입력한 password
		String password = member.getUserPw();
		if(password.equals("")) {
			//개인정보 update(선생님과 동일)
			result = profileDao.updateProfile(member);
		}else {
			//암호화할 password
			String secPw = "";
		
			//비밀번호 암호화
			secPw = passwordEncoder.encode(password);
			
			//비밀번호 set
			member.setUserPw(secPw);
			
			//개인정보 update
			result = profileDao.updateProfile(member);
		}
					
		return result;
	}
	
	@Override
	public int countIsEnd(int userNo) {
		return sutProfileDao.countIsEnd(userNo);
	}
	

}
