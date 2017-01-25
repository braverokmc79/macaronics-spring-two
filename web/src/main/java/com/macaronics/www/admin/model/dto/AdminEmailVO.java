package com.macaronics.www.admin.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class AdminEmailVO {
	
	private Integer idx;
	private String senderName;
	private String senderMail;
	
	private String receiveMail;
	private String subject;
	private String message;
	private Date regdate;
	
	private MultipartFile files;
}
