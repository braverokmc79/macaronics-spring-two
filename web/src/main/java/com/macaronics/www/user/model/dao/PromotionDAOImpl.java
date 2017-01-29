package com.macaronics.www.user.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.PromotionVO;


@Repository
public class PromotionDAOImpl implements PromotionDAO{

	
	private final String namespace=SqlServerEnvironment.SQL+".PromotionMapper";
	
	private final static Logger logger  =LoggerFactory.getLogger(PromotionDAOImpl.class);

	
	@Inject
	private SqlSession sqlSession; 
	
	
	
	@Override
	public PromotionVO getRead(Integer idx) {
		
		return sqlSession.selectOne(namespace+".getRead", idx);
	}

	@Override
	public void viewCoutUpdate(Integer idx) {
		sqlSession.update(namespace+".viewCoutUpdate", idx);
	} 

	
	
	
}





