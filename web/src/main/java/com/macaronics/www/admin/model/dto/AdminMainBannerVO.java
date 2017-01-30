package com.macaronics.www.admin.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminMainBannerVO {

	private Integer idx;
	private String img_url;
	private Integer proudct_Id;
	private String display;

	
	
	private String oldImg;
	private MultipartFile file;

	private String product_name;
	private Integer price;
	private String product_state; //상태
	private String  picture_url;
	private Date regdate;
	
}
