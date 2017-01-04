package com.macaronics.www.member.model.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
		
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	
	
	
}
