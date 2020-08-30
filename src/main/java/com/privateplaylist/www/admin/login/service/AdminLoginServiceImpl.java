package com.privateplaylist.www.admin.login.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateplaylist.www.admin.login.dao.AdminLoginDao;
import com.privateplaylist.www.dto.Admin;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	AdminLoginDao adminLoginDao;
	
	@Override
	public Admin selectAdmin(Map<String, Object> adminMap) {
		// 사용자가 입력한 비밀번호
		String password = (String) adminMap.get("adminPw");

		// DB에 저장된 사용자 정보
		Admin admin = adminLoginDao.selectAdmin(adminMap);

		if (admin != null) {
			// 사용자가 입력한 비밀번호와 DB에 인코딩되어 저장된 비밀번호가 같은지 확인
			if (password.matches(admin.getAdminPw())) {
				System.out.println("비밀번호 확인");
			} else {
				return null;
			}
		}
		return admin;
	}

	@Override
	public void logOut(HttpSession session) {
		
		adminLoginDao.logOut(session);
		
	}

}
