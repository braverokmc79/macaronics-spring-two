package com.macaronics.www.member.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	
	private Date regdate;
	private Date updatedate; 	
	
	
	private String confirmPassword;
	private String password_key;
	
	private int member_level;
	
}
