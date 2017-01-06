package com.macaronics.www.member.model.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeBoardReplyVO {

	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	private String username;
	private Date regdate;
	private Date updatedate;
	
	
	
	
}
