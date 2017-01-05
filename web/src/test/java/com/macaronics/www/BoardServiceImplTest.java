package com.macaronics.www;

import static org.junit.Assert.fail;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.member.service.board.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardServiceImplTest {

	@Inject	
	BoardService boardService;
	
	@Test
	public void testBoardList() {
		
		boardService.boardList(1, 10, "", "");	
	}

/*	@Test
	public void testBoardCreate() {
	   BoardVO vo =new BoardVO();
	   vo.setContent("ssssss");
	   vo.setTitle("ssss");
	   vo.setWriter("sssss");
	   boardService.boardCreate(vo);
	}

	@Test
	public void testBoardRead() {
		//boardService.boardRead(1);
	}

	@Test
	public void testBoardUpdate() {
		BoardVO vo =new BoardVO();
		vo.setContent("cccc");
		vo.setTitle("ccc");
		vo.setWriter("ccc");
		boardService.boardUpdate(vo);
	}

	@Test
	public void testBoardDelete() {
		boardService.boardDelete(2);
	}*/

}
