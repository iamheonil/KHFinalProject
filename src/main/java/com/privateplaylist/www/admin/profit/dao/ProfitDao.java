package com.privateplaylist.www.admin.profit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfitDao {
	
	@Autowired
	SqlSessionTemplate sqlsession;

	public int selectprofit01() {
		return sqlsession.selectOne("Profit.selectprofit01");
	}

	public int selectprofit02() {
		return sqlsession.selectOne("Profit.selectprofit02");
	}

	public int selectprofit03() {
		return sqlsession.selectOne("Profit.selectprofit03");
	}

	public int selectprofit04() {
		return sqlsession.selectOne("Profit.selectprofit04");
	}

	public int selectprofit05() {
		return sqlsession.selectOne("Profit.selectprofit05");
	}

	public int selectprofit06() {
		return sqlsession.selectOne("Profit.selectprofit06");
	}

	public int selectprofit07() {
		return sqlsession.selectOne("Profit.selectprofit07");
	}

	public int selectprofit08() {
		return sqlsession.selectOne("Profit.selectprofit08");
	}

	public int selectprofit09() {
		return sqlsession.selectOne("Profit.selectprofit09");
	}

	public int selectprofit10() {
		return sqlsession.selectOne("Profit.selectprofit10");
	}

	public int selectprofit11() {
		return sqlsession.selectOne("Profit.selectprofit11");
	}

	public int selectprofit12() {
		return sqlsession.selectOne("Profit.selectprofit12");
	}
	
	
}
