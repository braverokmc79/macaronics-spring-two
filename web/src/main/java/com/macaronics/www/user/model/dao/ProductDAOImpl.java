package com.macaronics.www.user.model.dao;

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
public class ProductDAOImpl implements ProductDAO {

	
	private static final Logger logger =LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	private final static String namespace=SqlServerEnvironment.SQL+"productMapper";

	
	@Override
	public List<ProductShopVO> productList(int start, int end, String search_option, String keyword)
			throws Exception {
		Map<String, Object> map =new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectList(namespace+".productList", map);
	}

	@Override
	public ProductShopVO detailProduct(Integer product_id) {
		
		return sqlSession.selectOne(namespace+".detailProduct",  product_id);
	}

	
	
	@Override
	public void updateProduct(ProductShopVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateProduct", vo);
	}

	@Override
	public void deleteProduct(Integer product_id) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deleteProduct", product_id);
	}

	
	//조회수 증가
	@Override
	public void updateViewCount(Integer product_id) {
	
		sqlSession.update(namespace+".updateViewCount", product_id);
		
	}

	@Override
	public List<String> getAttach(Integer product_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getAttach", product_id);
	}
	
	
	

	@Override
	public int countArticle(String search_option, String keyword) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace+".countArticle", map);
	}
	
	

}
