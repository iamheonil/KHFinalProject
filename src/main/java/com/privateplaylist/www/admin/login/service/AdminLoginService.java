package com.privateplaylist.www.admin.login.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.privateplaylist.www.dto.Admin;


public interface AdminLoginService {

	// 멤버 정보 조회 메소드
    public Admin selectAdmin(Map<String, Object> adminMap);
	
    // 로그아웃 메소드
    public void logOut(HttpSession session);
}
