package com.macaronics.www.user.service;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface ProductService {
	

	public List<ProductShopVO> productList() throws Exception;
	ProductShopVO detailProduct(Integer product_id);
	public void updateProduct(ProductShopVO vo);
	void deleteProduct(Integer product_id);
	
	
	//첨부 파일
	public List<String> getAttach(Integer product_id) throws Exception;

}
