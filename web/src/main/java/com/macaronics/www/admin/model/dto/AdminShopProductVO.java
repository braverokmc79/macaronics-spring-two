package com.macaronics.www.admin.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AdminShopProductVO {

    private int categoryIdx;
	private int categoryBno;
	private int categoryRno;
    
	
	private String productName;
	
	private int amount;  //수량
    private String[] mfiles;

    private String productState; 
   
    private int deliver; // default 3만
    private int deliverMoney;
    
   
    private String description; 
    
    private String bigDescription;

	private Date regdate;
	private Date updatedate;
    
    
	private Integer view_count; // 조회수
    
    
}
