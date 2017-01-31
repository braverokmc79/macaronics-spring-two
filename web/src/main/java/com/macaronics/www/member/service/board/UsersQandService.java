package com.macaronics.www.member.service.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface UsersQandService {
	public void qnaInsert(UsersQandAVO vo);
	
	public List<UsersQandAVO> qnaList(String userid, PageAndSearch pas);
	
	public void qnaUpdate(UsersQandAVO vo);
	
	public UsersQandAVO getQnA(Integer idx, String userid);
	
	
	public void qnaDelete(Integer idx);

	public Integer listCount(String userid);
}
