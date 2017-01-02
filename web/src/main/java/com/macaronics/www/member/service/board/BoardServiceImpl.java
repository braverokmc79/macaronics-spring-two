package com.macaronics.www.member.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.member.model.dao.board.BoardDAO;
import com.macaronics.www.member.model.dto.board.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	private static Logger logger=LoggerFactory.getLogger(BoardServiceImpl.class);
	
	
	@Override
	public List<BoardVO> boardList() {
		List<BoardVO> list=null;
		try {	
			boardDAO.boardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public void boardCreate(BoardVO vo) {
		try{
			boardDAO.boardCreate(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	

	@Override
	public BoardVO boardRead(Integer bno) {
		BoardVO vo =null;
		try{
			vo=boardDAO.boardRead(bno);
		}catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void boardUpdate(BoardVO vo) {
		try{
			boardDAO.boardUpdate(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	@Override
	public void boardDelete(Integer bno) {
		try{
			boardDAO.boardDelete(bno);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
}
