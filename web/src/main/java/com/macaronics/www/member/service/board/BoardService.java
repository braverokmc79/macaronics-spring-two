package com.macaronics.www.member.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.util.mysql.SearchCriteria;

public interface BoardService {

	public List<BoardVO> boardList(int start, int end, String search_option, String keyword) ;
	
	
	public void boardCreate(BoardVO vo);
	public BoardVO boardRead(Integer bno, HttpSession session);
	public void boardUpdate(BoardVO vo);
	public void boardDelete(Integer bno);
	public BoardVO getBoard(Integer bno);

	
	public int countArticle(String search_option, String keyword);


	public List<BoardVO> mysqlListSearchCriteria(SearchCriteria cri);


	public int mysqlListSearchCount(SearchCriteria cri);

	
	
	
}
