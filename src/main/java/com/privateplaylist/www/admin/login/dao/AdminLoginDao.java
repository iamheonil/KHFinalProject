package com.privateplaylist.www.admin.login.dao;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Admin;

@Repository
public class AdminLoginDao {

	@Autowired
	SqlSessionTemplate session;

	public Admin selectAdmin(Map<String, Object> adminMap) {

		return session.selectOne("ADMIN.selectAdmin", adminMap);
		
	}
	
	public void logOut(HttpSession session) {
		session.invalidate();
	}
	

}
