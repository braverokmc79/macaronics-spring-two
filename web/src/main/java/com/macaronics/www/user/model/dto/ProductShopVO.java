package com.macaronics.www.user.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductShopVO {

	private Integer product_id;
	private String product_name;
	private Integer price;
	private String description; 
	private String  picture_url;
	private Date regdate;
    private MultipartFile file1;
	
    
    private Integer amount;  //수량
    private String product_state; //상태
    private long big_description; //


}
