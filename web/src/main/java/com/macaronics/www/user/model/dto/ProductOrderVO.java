package com.macaronics.www.user.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductOrderVO {
	
	private String idx;
	private Integer money;
	private Integer product_id;
	private String product_name;
	private Integer price;
	private Integer amount;
	private String picture_url;
	private String product_state;
	private String username;
	private String userid;
	private Date regdate;
	
	
	
	
	private Integer deliver=30000 ;  //배송비 만원 이하 2500원 추가
	private Integer deliver_money=2500; //기본 배송룡 2500
	
	private Integer sum;
	private Integer total_deliver_money; //총 배송료
	private Integer total_sum; //(합계 - 배송료) 총 합계 비용
	
}



