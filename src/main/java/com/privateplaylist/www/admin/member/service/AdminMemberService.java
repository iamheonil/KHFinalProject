package com.privateplaylist.www.admin.member.service;

import java.util.Map;

public interface AdminMemberService {

	public Map<String, Object> selectStuList(int cPage, int cntPerPage);

	public Map<String, Object> selectStuDetail(int userNo);

}
