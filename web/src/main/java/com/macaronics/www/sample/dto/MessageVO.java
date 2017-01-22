package com.macaronics.www.sample.dto;

import java.util.Date;

import com.macaronics.www.util.xss.XssDefender;

import lombok.Data;

@Data
public class MessageVO {

	private Integer mid;
	private String targetid;
	private String sender;
	private String message;
	private Date opendate;
	private Date senddate;
	

	public void setMessage(String message) {
	
		String me="";
		try {
			 me =XssDefender.removeTag(message);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		this.message = me;
	}
	
}
