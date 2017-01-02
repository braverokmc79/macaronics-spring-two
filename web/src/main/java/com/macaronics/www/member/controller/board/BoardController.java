package com.macaronics.www.member.controller.board;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.service.board.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	private final String JSP_PAGE ="/view/board/";
	
	@Inject
	private BoardService boardService;
	
	
	@RequestMapping(value="/listAll.do", method=RequestMethod.GET)
	public ModelAndView boardList(){
	
		
		return new ModelAndView(JSP_PAGE+"list", "list", boardService.boardList());
	}
	
	
	
	
	
	
	
	
	
	
	
}
