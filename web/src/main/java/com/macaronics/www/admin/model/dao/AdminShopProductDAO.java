package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface AdminShopProductDAO {

	public void productInsert(ProductShopVO vo);
	
	//첨부파일
	public void addAttach(String fullName) throws Exception;
	
	
	public List<ProductShopVO> productList();
	
}
