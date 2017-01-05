package com.macaronics.www.member.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.member.service.board.BoardService;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	private final String JSP_PAGE ="/view/board/";
	
	@Inject
	private BoardService boardService;
	


	
	@RequestMapping(value="/listAll.do", method=RequestMethod.GET)
	public ModelAndView boardList(
			@RequestParam(defaultValue="1") Integer curPage,
			@RequestParam(  required=false) String search_option , 
			@RequestParam( required=false) String keyword){
	
		ModelAndView mv =new ModelAndView();
		
		int count =boardService.countArticle(search_option, keyword);
		
		//페이지 나누기 관련 처리
		Pager pager =new Pager(count, curPage);
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		
		List<BoardVO> list=boardService.boardList(start, end, search_option, keyword);
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		
		mv.addObject("map", map);
		mv.setViewName(JSP_PAGE+"list");
		
		return mv;
	}
	
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeDo (){
		
		return JSP_PAGE+"write";
	}
	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertDo(@ModelAttribute  BoardVO  vo){
		
		boardService.boardCreate(vo);
		return "redirect:listAll.do";
	}
	
	
	
	//조회수 증가
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String viewDo(@RequestParam Integer bno, Model model, HttpSession session){
				
		model.addAttribute("vo", boardService.boardRead(bno, session));
		
		return   JSP_PAGE+"view";
	}
	
	
	
	//업데이트 화면 으로 가기
	@RequestMapping(value="/updateform.do", method=RequestMethod.POST)
	public String updateForm(@RequestParam Integer bno, Model model){
		 BoardVO  vo = boardService.getBoard(bno);
		model.addAttribute("vo", vo);
		return JSP_PAGE+"update";
	}
	
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo){
		boardService.boardUpdate(vo);
		return "redirect:listAll.do";
	}
	

	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete(@RequestParam Integer bno){
		
		logger.info("삭제  :" + bno);
		boardService.boardDelete(bno);
		return "redirect:listAll.do";
	}
	
	
	
	
}



