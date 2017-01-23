package com.macaronics.www.user.model.dao;

import com.macaronics.www.user.model.dto.CouponVO;

public interface CouponDAO {

	
	public CouponVO getRead(Integer idx);
	
	public void viewCoutUpdate(Integer idx);
	
}
