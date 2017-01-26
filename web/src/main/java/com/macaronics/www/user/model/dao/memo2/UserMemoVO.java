package com.macaronics.www.user.model.dao.memo2;

import java.util.Date;

import lombok.Data;

@Data
public class UserMemoVO {

	private Integer idx;
	private String userid;
	private String friendName;
	
	private String email;
	
	private String phone;
	
	private String memo;
	private Date post_date;
	
	private Integer rn;
}
