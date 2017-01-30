package com.macaronics.www.member.service.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;

public interface UsersQandService {
	public void qnaInsert(UsersQandAVO vo);
	
	public List<UsersQandAVO> qnaList(String userid);
	
	public void qnaUpdate(UsersQandAVO vo);
	
	public UsersQandAVO getQnA(Integer idx);
	
	
	public void qnaDelete(Integer idx);
}
