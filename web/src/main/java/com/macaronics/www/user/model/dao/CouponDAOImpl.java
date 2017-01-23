package com.macaronics.www.user.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.CouponVO;


@Repository
public class CouponDAOImpl implements CouponDAO {

	private final String namespace=SqlServerEnvironment.SQL+".CouponMapper";
	
	private final static Logger logger  =LoggerFactory.getLogger(CouponDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession; 
	
	
	@Override
	public CouponVO getRead(Integer idx) {
	
		return sqlSession.selectOne(namespace+".getRead", idx);
	}


	@Override
	public void viewCoutUpdate(Integer idx) {
		
		sqlSession.update(namespace+".viewCoutUpdate", idx);
	}

	
	
	
	
}
