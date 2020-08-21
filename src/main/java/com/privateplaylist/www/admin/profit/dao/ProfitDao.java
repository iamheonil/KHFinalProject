package com.privateplaylist.www.admin.profit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfitDao {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	
	
}
