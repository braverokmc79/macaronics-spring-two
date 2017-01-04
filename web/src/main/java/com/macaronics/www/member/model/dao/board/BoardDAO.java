package com.macaronics.www.member.model.dao.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.BoardVO;

public interface BoardDAO {

	public List<BoardVO> boardList(String search_option, String keyword) ;
	public void boardCreate(BoardVO vo);
	public BoardVO boardRead(Integer bno);
	public void boardUpdate(BoardVO vo);
	public void boardDelete(Integer bno);
	
	
	public void viewCntUpdate(Integer bno);
	public BoardVO getBoard(Integer bno);

	
	public int countArticle(String search_option, String keyword);
	
}
