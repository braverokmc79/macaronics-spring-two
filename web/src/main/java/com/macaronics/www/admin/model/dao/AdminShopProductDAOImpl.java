package com.macaronics.www.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	@Override
	public List<ProductShopVO> productList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".productList");
	}


	@Override
	public void delteAttachImg(String fullname) {
		
		sqlSession.delete(namespace+".delteAttachImg", fullname);
	}


	@Override
	public void deleteAttach(Integer proudct_id) throws Exception {
		
		sqlSession.delete(namespace+".deleteAttach", proudct_id);
	}


	@Override
	public void replaceAttach(String fullName, Integer product_id) throws Exception {
		Map<String , Object> pramMap =new HashMap<>();
		
		pramMap.put("fullName", fullName);
		pramMap.put("product_id", product_id);
		
		sqlSession.insert(namespace+".replaceAttach", pramMap);
	}


	@Override
	public void updateProduct(ProductShopVO vo) {
		
		sqlSession.update(namespace+".updateProduct", vo);
	}


	@Override
	public int productOrederConfirm(Integer product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".productOrederConfirm", product_id);
	}


	@Override
	public void productDelete(Integer product_id) {
	
		sqlSession.delete(namespace+".productDelete", product_id);
	}

	
	
	
	
}
