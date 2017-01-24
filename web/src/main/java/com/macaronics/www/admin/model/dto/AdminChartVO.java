package com.macaronics.www.admin.model.dto;

import lombok.Data;

@Data
public class AdminChartVO {

	//구글 차트 카테고리별 상품 개수
	private Integer product_count;
	private String category_name;
	
	
}
