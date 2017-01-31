package com.macaronics.www.member.model.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class UsersQandAVO {

	private Integer idx;
	private String userid;
	private String subject;
	private String content;

	private String qcontent;
	private String qsubject;
	
	private Integer ref; //"게시물 그룹 ID",
	private Integer depth; //"답변 단계",
	private Integer reorder; //"그룹 내에서의 순서"
	
	private String answer;  //답변 체크
	private String secret;
	private Date regdate;


}
