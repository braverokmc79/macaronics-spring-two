package com.macaronics.www.user.model.dao;

import com.macaronics.www.user.model.dto.PromotionVO;

public interface PromotionDAO {

	
	public PromotionVO getRead(Integer idx);
	
	public void viewCoutUpdate(Integer idx);
	
}
