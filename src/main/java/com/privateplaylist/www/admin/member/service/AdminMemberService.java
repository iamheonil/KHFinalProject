package com.privateplaylist.www.admin.member.service;

import java.util.Map;

public interface AdminMemberService {

	Map<String, Object> selectStuList(int cPage, int cntPerPage);

}
