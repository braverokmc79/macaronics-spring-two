package com.macaronics.www.member.model.dao.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;

public interface UsersQandADAO {

	public void qnaInsert(UsersQandAVO vo);
	
	public List<UsersQandAVO> qnaList(String userid);
	
	public void qnaUpdate(UsersQandAVO vo);
	
	public UsersQandAVO getQnA(Integer idx);
	
	
	public void qnaDelete(Integer idx);
	
}
