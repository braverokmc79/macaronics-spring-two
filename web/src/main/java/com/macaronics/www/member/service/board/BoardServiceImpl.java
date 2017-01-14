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
import com.macaronics.www.util.mysql.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	private static Logger logger=LoggerFactory.getLogger(BoardServiceImpl.class);
	
	
	@Override
	public List<BoardVO> boardList(int start, int end, String search_option, String keyword) {
		List<BoardVO> list=null;
		try {	
			list=boardDAO.boardList(start, end, search_option, keyword);
			
			for(BoardVO  li : list){
				logger.info("정보 : " + li.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Transactional //트랜잭션 처리 method 로 설정
	@Override
	public void boardCreate(BoardVO vo) {
		try{
			
			//게시물 등록
			boardDAO.boardCreate(vo);
			
			//첨보 파일 정보 등록
			String[] files=vo.getFiles(); //첨부파일 배열
			logger.info(" 첨부파일  :"+ vo.getFiles());
			//첨부파일이 없으면 종료
			if(files==null) return;
			//첨부파일들의 정보를  tbl_attach 테이블에 insert
			for(String name : files){
				boardDAO.addAttach(name);
			}	
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

	//첨부 파일 가져오기
	@Override
	public List<String> getAttach(Integer bno) {
		// TODO Auto-generated method stub
		return boardDAO.getAttach(bno);
	}

	
	
	

	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return boardDAO.countArticle(search_option, keyword);
	}


	@Override
	public List<BoardVO> mysqlListSearchCriteria(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.mysqlListSearchCriteria(cri);
	}


	@Override
	public int mysqlListSearchCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.mysqlListSearchCount(cri);
	}

	@Override
	public void attachDelete(String fileName) {
		boardDAO.attachDelete(fileName);
		
	}


	
	
}
