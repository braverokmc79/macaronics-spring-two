package com.macaronics.www.admin.service;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface AdminShopProductService {
	
	public void productInsert(ProductShopVO vo);
	
	
	public List<ProductShopVO> productList();
	
	
	
	
}
