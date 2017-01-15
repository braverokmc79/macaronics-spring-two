package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.user.model.dao.ProductDAO;
import com.macaronics.www.user.model.dto.ProductShopVO;

@Service
public class ProductServiceImpl implements ProductService {

	private static final Logger logger =LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO dao;
	
	@Override
	public List<ProductShopVO> productList() throws Exception {
		// TODO Auto-generated method stub
		return dao.productList();
	}

	@Override
	public ProductShopVO detailProduct(Integer product_id) {
		// TODO Auto-generated method stub
		return dao.detailProduct(product_id);
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

}
