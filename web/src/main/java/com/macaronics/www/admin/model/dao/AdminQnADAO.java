package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface AdminQnADAO {

	public List<UsersQandAVO> questionList(PageAndSearch pas);
	
	public List<UsersQandAVO> answerList(PageAndSearch pas);

	public void replyInsert(UsersQandAVO vo);

	public void reorderUpdate(int ref, int reorder);
	
	public void answerUpdate(int ref);

	public UsersQandAVO getQnA(Integer idx);

	public Integer listCount(String answer);
	
	
	
}
