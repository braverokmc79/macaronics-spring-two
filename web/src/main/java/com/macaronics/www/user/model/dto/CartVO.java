package com.macaronics.www.user.model.dto;

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
	private Integer amount;
	
	
}
