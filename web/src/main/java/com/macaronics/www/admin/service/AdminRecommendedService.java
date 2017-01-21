package com.macaronics.www.admin.service;

import com.macaronics.www.admin.model.dto.AdminRecommendedVO;
import com.macaronics.www.user.model.dto.ProductShopVO;

public interface AdminRecommendedService {

	int confirmProductId(Integer product_id);

	void registerProduct(AdminRecommendedVO vo);

	int getProductId(AdminRecommendedVO vo);

	public ProductShopVO detailProduct(Integer product_id);
	
}
