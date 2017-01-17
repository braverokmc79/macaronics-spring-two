package com.macaronics.www.user.service;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductOrderVO;

public interface ProductOrderService {
	
	public List<ProductOrderVO> productOrder(String userid);
	
	public void productInsert(ProductOrderVO vo);
	
	public int getAmoutProduct(Integer product_id);

}
