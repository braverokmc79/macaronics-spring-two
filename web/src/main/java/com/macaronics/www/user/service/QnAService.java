package com.macaronics.www.user.service;

import java.util.List;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface QnAService {

	
	public List<UsersQandAVO> list(PageAndSearch pas);
	
	public UsersQandAVO getRead(Integer idx);
		
	public Integer count();
	
	
}
