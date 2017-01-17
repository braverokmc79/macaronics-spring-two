package com.macaronics.www.user.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.ProductOrderVO;


@Repository
public class ProductOrderDAOImpl implements ProductOrderDAO {

	@Inject
	private SqlSession session;
	
	private static final Logger logger=LoggerFactory.getLogger(ProductOrderDAOImpl.class);
	
	
	private static final String namespace=SqlServerEnvironment.SQL+"productOrderMapper";

	
	@Override
	public List<ProductOrderVO> productOrder(String userid) {
		// TODO Auto-generated method stub
		return session.selectList(namespace +".productOrder" , userid);
	}

	
	
	@Override
	public void productInsert(ProductOrderVO vo) {	
		session.insert(namespace+".productInsert", vo);
	}



	//상품 전체 수량 확인
	@Override
	public int getAmoutProduct(Integer product_id) {
		
		return session.selectOne(namespace+".getAmoutProduct", product_id);
	}
	
	
	

}


