package com.macaronics.www.member.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;

public interface FreeBoadReplyService {

	public List<FreeBoardReplyVO> list(Integer bno);
	public void create(FreeBoardReplyVO vo);
	public void update(FreeBoardReplyVO vo);
	public void delete(Integer rno);
	
	public int countOracleReply(Integer bno);
	public List<FreeBoardReplyVO> oracleList(Integer bno, int start, int end, HttpSession session);
	
	//댓글의 상세정보
	public FreeBoardReplyVO detail(int rno);
	
	
	//댓글 수정
	public void replyAlter(FreeBoardReplyVO vo);
	
	
	//댓글 삭제
	public void replyDelete(Integer rno);
	
	
	
}


