package com.macaronics.www.user.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductShopVO {

	private Integer product_id;
	
	private Integer category_idx;
	private Integer category_bno;
	private Integer category_rno;
	
	private String product_name;
	private Integer price;
	private String description; 
	private String  picture_url;

	private Date regdate;
	private Date updatedate;
	private MultipartFile file1;
	
    private Integer deliver; // default 3만
    private Integer deliver_money; // default 2500
    
    private Integer amount;  //수량
    private String product_state; //상태
    private String big_description; //

    private String[] mfiles;

    
  //////////////////////////////////////////
    private String productName;
    
    private Integer categoryIdx;
	private Integer categoryBno;
	private Integer categoryRno;
    private Integer deliverMoney;
    private String productState; 
   
    
    private String bigDescription;
    
///////////////////////////////
    //카테고리 title
    private String category1_title;
    private String category2_title;
    private String category3_title;
    
    private Integer view_count; // 조회수
}



