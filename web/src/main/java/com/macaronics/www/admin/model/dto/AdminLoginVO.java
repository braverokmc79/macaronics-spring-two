package com.macaronics.www.admin.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AdminLoginVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	
	private Date regdate;
	private Date updatedate; 	
	
	
	private String confirmPassword;
	private String password_key;
	
	private Integer member_level;
	
	private boolean userCookie;
	
	
}
