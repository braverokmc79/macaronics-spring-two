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
import com.macaronics.www.util.oralce.PageAndSearch;

@Repository
public class ProductDAOImpl implements ProductDAO {

	
	private static final Logger logger =LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	private final static String namespace=SqlServerEnvironment.SQL+"productMapper";

	
	@Override
	public List<ProductShopVO> productList(int start, int end, PageAndSearch pas)
			throws Exception {
		Map<String, Object> map =new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", pas.getSearch_option());
		map.put("keyword", pas.getKeyword());
		map.put("sortby", pas.getSortby());
		
		logger.info("************ sortby : " + pas.getSortby());
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
		
		return sqlSession.selectList(namespace+".getAttach", product_id);
	}
	
	

	@Override
	public int countArticle(String search_option, String keyword) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace+".countArticle", map);
	}

	@Override
	public List<ProductShopVO> togetherRecommendProduct(Integer rno) {
		logger.info("rno 값 : " + rno);
		return sqlSession.selectList(namespace+".togetherRecommendProduct", rno);
	}

	@Override
	public List<ProductShopVO> viewsBnoProduct(Integer bno) {
		logger.info("bno 값 : " + bno);
		return sqlSession.selectList(namespace+".viewsBnoProduct", bno);
	}

	@Override
	public List<ProductShopVO> viewsProduct() {
		
		return sqlSession.selectList(namespace+".viewsProduct" );
	}
	
	

}




