package com.macaronics.www.user.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {

	private Integer cart_id;
	private String userid;
	private String username;
	private Integer product_id;
	private String product_name;
	private Integer price;
	private Integer money;
	private Integer amount; //구매수량
	private String product_state;
	
	private String picture_url;
	private Date cart_regdate;
	
	private Integer product_amount; //상품 수량
	
	
	private Integer deliver=30000 ;  //배송비 만원 이하 2500원 추가
	private Integer deliver_money=2500; //기본 배송룡 2500
	private Integer total_deliver_money; //총 배송료
	
	
	private Integer total_sum;
}
