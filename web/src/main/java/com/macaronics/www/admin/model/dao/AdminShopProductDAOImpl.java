package com.macaronics.www.admin.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.ProductShopVO;

@Repository
public class AdminShopProductDAOImpl implements AdminShopProductDAO {

	
	
	private static Logger logger =LoggerFactory.getLogger(AdminShopProductDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	private static String namespace =SqlServerEnvironment.SQL+"adminShopProductMapper";
	
	
	@Override
	public void productInsert(ProductShopVO vo) {
		sqlSession.insert(namespace+".productInsert", vo);

	}


	@Override
	public void addAttach(String fullName) throws Exception {
		
		sqlSession.insert(namespace+".addAttach" , fullName);
		
	}

	
	
	
	
}
