package com.macaronics.www.admin.service;

import java.util.List;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface AdminQnAService {

	
	public List<UsersQandAVO> questionList(PageAndSearch pas);
	
	public List<UsersQandAVO> answerList(PageAndSearch pas);

	public void reorderUpdate(int ref, int reorder);

	public void replyInsert(UsersQandAVO vo);
	
	public UsersQandAVO getQnA(Integer idx);

	public Integer listCount(String answer);
}
