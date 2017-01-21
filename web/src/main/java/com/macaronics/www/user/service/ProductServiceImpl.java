package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.user.model.dao.ProductDAO;
import com.macaronics.www.user.model.dto.ProductShopVO;

@Service
public class ProductServiceImpl implements ProductService {

	private static final Logger logger =LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO dao;
	
	@Override
	public List<ProductShopVO> productList(int start, int end, String search_option, String keyword) throws Exception {
	
		return dao.productList(start, end, search_option, keyword);
	}

	
	@Transactional
	@Override
	public ProductShopVO detailProduct(Integer product_id) {
		ProductShopVO vo =null;
		try{
			vo=dao.detailProduct(product_id);
			//조회수 증가		
			dao.updateViewCount(product_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void updateProduct(ProductShopVO vo) {
		// TODO Auto-generated method stub
		dao.updateProduct(vo);
	}

	@Override
	public void deleteProduct(Integer product_id) {
		// TODO Auto-generated method stub
		dao.deleteProduct(product_id);
	}

	
	//첨부 파일
	@Override
	public List<String> getAttach(Integer product_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(product_id);
	}

	
	
	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return dao.countArticle(search_option, keyword);
	}


	@Override
	public List<ProductShopVO> togetherRecommendProduct(Integer category_rno) {
		List<ProductShopVO> list=null;
		try {
			list=dao.togetherRecommendProduct(category_rno);
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<ProductShopVO> viewsBnoProduct(Integer category_bno) {
		List<ProductShopVO> list=null;
		try {
			list =dao.viewsBnoProduct(category_bno);
		} catch (Exception e) {
				e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<ProductShopVO> viewsProduct() {
		List<ProductShopVO> list=null;
		try {
			list =dao.viewsProduct();
		} catch (Exception e) {
				e.printStackTrace();
		}
		return list;
		
	}

	
	
	
}
