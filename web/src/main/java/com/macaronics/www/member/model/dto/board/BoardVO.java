package com.macaronics.www.member.model.dto.board;

import java.util.Date;

import com.macaronics.www.util.xss.XssDefender;

import lombok.Data;

@Data
public class BoardVO {
		
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	
	private String member_level;
	private String username;
	private String userid;
	
	private int cnt;
	
	
	private String show;
	
	
	
	
	public void setTitle(String title) {
		this.title = XssDefender.inputString(title);
	}
	
	public void setWriter(String writer) {
		this.writer = XssDefender.inputString(writer);
	}
	
	

	
	
	
	
	
	
}



