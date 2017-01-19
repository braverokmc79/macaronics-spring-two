package com.macaronics.www.admin.service;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface AdminShopProductService {
	
	public void productInsert(ProductShopVO vo);
	
	
	public List<ProductShopVO> productList();


	public void delteAttachImg(String fullname);
	
	
	// 상품 수정
	public void updateProduct(ProductShopVO vo);


	public void productDelete(Integer product_id);


	public int productOrederConfirm(Integer product_id);


	public void deleteAttach(Integer product_id);
	
	
}
