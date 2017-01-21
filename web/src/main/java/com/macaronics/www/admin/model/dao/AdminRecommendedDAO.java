package com.macaronics.www.admin.model.dao;

import com.macaronics.www.admin.model.dto.AdminRecommendedVO;
import com.macaronics.www.user.model.dto.ProductShopVO;


public interface AdminRecommendedDAO {

	int confirmProductId(Integer product_id);

	void registerProduct(AdminRecommendedVO vo);

	int getProductId(AdminRecommendedVO vo);

	ProductShopVO detailProduct(Integer product_id);

	
	
}
