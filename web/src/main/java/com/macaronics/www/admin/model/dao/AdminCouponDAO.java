package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface AdminCouponDAO {

	
	public List<CouponVO> getCouponList(int start, int end, PageAndSearch pas);
	
	public void couponInsert(CouponVO vo);
	
	public void couponUpdate(CouponVO vo);
	
	public void couponDelete(Integer idx);

	public CouponVO couponUpdateForm(Integer idx);

	public int countArticle(String search_option, String keyword);
	
	
	
	
	
}
