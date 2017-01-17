package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductOrderVO;

public interface ProductOrderDAO {

	public List<ProductOrderVO> productOrder(String userid);
	
	public void productInsert(ProductOrderVO vo);

	public int getAmoutProduct(Integer product_id);
	
	
	
	
}
