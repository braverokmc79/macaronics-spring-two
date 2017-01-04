package com.macaronics.www.member.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.member.model.dao.board.BoardDAO;
import com.macaronics.www.member.model.dto.board.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	private static Logger logger=LoggerFactory.getLogger(BoardServiceImpl.class);
	
	
	@Override
	public List<BoardVO> boardList(String search_option, String keyword) {
		List<BoardVO> list=null;
		try {	
			list=boardDAO.boardList(search_option, keyword);
			
			for(BoardVO  li : list){
				logger.info("정보 : " + li.toString());
			}
			
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
	

	@Transactional
	@Override
	public BoardVO boardRead(Integer bno, HttpSession session) {
		BoardVO vo =null;
		try{
			vo=boardDAO.boardRead(bno);
		
			
			//조회수 증가	
			
			long update_time =0;
			//세션에 저장된 조회시간 검색
			if(session.getAttribute("update_time" +bno) !=null){
				update_time =(long)session.getAttribute("update_time"+ bno);	
			}
			//시스템 현재시간
			long current_time =System.currentTimeMillis();
			if(current_time - update_time > 24*60*60*1000){
				boardDAO.viewCntUpdate(bno);
				session.setAttribute("update_time"+bno, current_time);
			}
			
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


	@Override
	public BoardVO getBoard(Integer bno) {
		// TODO Auto-generated method stub
		return boardDAO.getBoard(bno);
	}


	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return boardDAO.countArticle(search_option, keyword);
	}

	
	
}
