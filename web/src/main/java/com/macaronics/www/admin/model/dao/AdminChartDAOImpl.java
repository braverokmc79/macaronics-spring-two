package com.macaronics.www.admin.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminChartVO;


@Repository
public class AdminChartDAOImpl implements AdminChartDAO {

	@Inject
	private SqlSession sqlSession;
	
	
	private final String namespace =SqlServerEnvironment.SQL +".adminChartMapper";
	
	
	private final static Logger logger =LoggerFactory.getLogger(AdminCouponDAOImpl.class);
	
	
	@Override
	public List<AdminChartVO> categoryNameAndCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".categoryNameAndCount");
	}

	
	
	
	
	
}
