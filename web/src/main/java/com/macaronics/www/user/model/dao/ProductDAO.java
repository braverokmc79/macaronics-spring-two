package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface ProductDAO {

	public List<ProductShopVO> productList() throws Exception;
	ProductShopVO detailProduct(Integer product_id);
	public void updateProduct(ProductShopVO vo);
	void deleteProduct(Integer product_id);
	
	
}