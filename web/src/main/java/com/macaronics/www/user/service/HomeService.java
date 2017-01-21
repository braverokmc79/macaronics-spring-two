package com.macaronics.www.user.service;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface HomeService {

	
	//최신 상품 목록 가져오기
	public List<ProductShopVO> newProudctList();
	
		
	//베스트 상품 목록 가져오기
	public List<ProductShopVO> bestProductList();
	
	
	//이벤트 상품 목록 가져오기
	public List<ProductShopVO> eventProductList();
	
}
