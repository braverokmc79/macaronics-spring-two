package com.macaronics.www.user.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CouponVO {
	private Integer idx;
	private String title;
	private String content ;
	private String img_url;
	private Date regdate;
	private Integer view_count;
	
	
	private MultipartFile files;
	
	private String oldImg;
	
}
