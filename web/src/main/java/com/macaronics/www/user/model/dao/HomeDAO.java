package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.user.model.dto.ProductShopVO;

public interface HomeDAO {

	
	//최신 상품 목록 가져오기
	public List<ProductShopVO> newProudctList();
	
		
	//베스트 상품 목록 가져오기
	public List<ProductShopVO> bestProductList();
	
	
	//이벤트 상품 목록 가져오기
	public List<ProductShopVO> eventProductList();
	
	//쿠폰 마지막 상품 가져오기
	public int couponLastProudctIdx();
	
	//쿠폰 마지막 상품
	public CouponVO lastCouponProduct(Integer idx);
	
	
}
