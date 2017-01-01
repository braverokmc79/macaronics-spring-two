package com.macaronics.www.sample.dto;

import lombok.Data;

@Data
public class ProductVO {

	private String name;
	private int money;
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductVO(String name, int money) {
		super();
		this.name=name;
		this.money=money;
	}

	
	
	
}
