package com.macaronics.www.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {

	private Integer mid;
	private String targetid;
	private String sender;
	private String message;
	private Date opendate;
	private Date senddate;
	
	
}
