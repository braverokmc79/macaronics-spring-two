package com.macaronics.www.admin.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminRecommendedVO;
import com.macaronics.www.user.model.dto.ProductShopVO;

@Repository
public class AdminRecommendedDAOImpl implements AdminRecommendedDAO {

	

	private static Logger logger =LoggerFactory.getLogger(AdminRecommendedDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	private static String namespace =SqlServerEnvironment.SQL+"recommenderProductMapper";


	@Override
	public int confirmProductId(Integer product_id) {
		
		return sqlSession.selectOne(namespace+".confirmProductId", product_id);
	}


	@Override
	public void registerProduct(AdminRecommendedVO vo) {
		
		
		sqlSession.update(namespace+".registerProduct", vo);
	}


	@Override
	public Integer getProductId(AdminRecommendedVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getProductId", vo);
	}


	@Override
	public ProductShopVO detailProduct(Integer product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".detailProduct", product_id);
	}
	
	
	
}
