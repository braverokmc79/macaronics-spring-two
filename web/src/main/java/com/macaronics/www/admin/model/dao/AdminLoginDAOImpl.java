package com.macaronics.www.admin.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminLoginVO;


@Repository
public class AdminLoginDAOImpl implements AdminLoginDAO {

	
	private static Logger logger =LoggerFactory.getLogger(AdminLoginDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	private static String namespace =SqlServerEnvironment.SQL+"adminLoginMapper";
	
	
	@Override
	public AdminLoginVO loginCheck(AdminLoginVO vo) {
		
		return sqlSession.selectOne(namespace+".loginCheck", vo);
	}


	@Override
	public AdminLoginVO getLoginInfo(String email) {
		
		return sqlSession.selectOne(namespace +".getLoginInfo", email);
	}
	
	

	
	
	

}




