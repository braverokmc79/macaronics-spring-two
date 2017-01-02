package com.macaronics.www.member.service.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList() ;
	public void boardCreate(BoardVO vo);
	public BoardVO boardRead(Integer bno);
	public void boardUpdate(BoardVO vo);
	public void boardDelete(Integer bno);

	
}
