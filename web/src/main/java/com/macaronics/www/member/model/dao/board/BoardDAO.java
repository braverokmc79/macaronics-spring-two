package com.macaronics.www.member.model.dao.board;

import java.util.List;

import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.util.mysql.SearchCriteria;

public interface BoardDAO {

	public void addAttach(String fullName);
	
	public List<BoardVO> boardList(int start, int end, String search_option, String keyword) ;
	public void boardCreate(BoardVO vo);
	public BoardVO boardRead(Integer bno);
	//첨부 파일 목록 가져오기
	public List<String> getAttach(Integer bno);
	
	public void boardUpdate(BoardVO vo);
	public void boardDelete(Integer bno);
	
	public void viewCntUpdate(Integer bno);
	public BoardVO getBoard(Integer bno);

	public int countArticle(String search_option, String keyword);
	
	public List<BoardVO> mysqlListSearchCriteria(SearchCriteria cri);
	public int mysqlListSearchCount(SearchCriteria cri);

	public void attachDelete(String fileName);

	
	
	
	
}
