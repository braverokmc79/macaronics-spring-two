package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminChartVO;

public interface AdminChartDAO {

	//카테고리 별 상품 개수	
	public List<AdminChartVO> categoryNameAndCount();
		
	
}
