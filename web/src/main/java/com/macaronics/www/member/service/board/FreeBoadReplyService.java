package com.macaronics.www.member.service.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;

public interface FreeBoadReplyService {

	public List<FreeBoardReplyVO> list(Integer bno);
	public void create(FreeBoardReplyVO vo);
	public void update(FreeBoardReplyVO vo);
	public void delete(Integer rno);
	
	public int countOracleReply(Integer bno);
	public List<FreeBoardReplyVO> oracleList(Integer bno, int start, int end);
	
	
	
}
