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

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.member.service.board.BoardService;
import com.macaronics.www.util.mysql.PageMaker;
import com.macaronics.www.util.mysql.SearchCriteria;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	private final String JSP_PAGE ="/view/board/";
	
	@Inject
	private BoardService boardService;
	
	
	@RequestMapping(value="/listAll.do", method=RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute("cri") SearchCriteria cri){

		
		ModelAndView mv =null;
		
		if(SqlServerEnvironment.SQL.equals("ORACLE")){
			//Orcle DB 일 경우
			PageAndSearch pas =new PageAndSearch();
			
			pas.setCurPage(cri.getPage());
			pas.setSearch_option(cri.getSearch_option());
			pas.setKeyword(cri.getKeyword());
			mv=oraclePageList(pas);
		}else{
			// MYSQL DB 일 경우
			mv =mysqlPageList(cri);
		}	
		return mv;
	}
	
	
	// 오라클 페이지 리스트 페이지 
	public ModelAndView  oraclePageList(PageAndSearch pas){
		
			ModelAndView mv =new ModelAndView();
		
			int count =boardService.countArticle(pas.getSearch_option(), pas.getKeyword());
			
			//페이지 나누기 관련 처리
			if(pas.getCurPage()==null){pas.setCurPage(1);}
			
	
			Pager pager =new Pager(count, pas.getCurPage());
			int start =pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			logger.info(" ****************   " + pas.toString() + "    메서드  : " + pas.searchQuery(1) +
					"  count : " + count + " start : " + start + "  end  : " + end);
			
			List<BoardVO> list=boardService.boardList(start, end, pas.getSearch_option(), pas.getKeyword());
			
			Map<String, Object> map =new HashMap<>();
			map.put("countList", count);
			map.put("list", list);
			map.put("pager", pager);
			/*map.put("search_option", pas.getSearch_option());
			map.put("keyword", pas.getKeyword());
			*/
				
			mv.addObject("map", map);
			mv.addObject("pageAndSearch", pas);
			
			mv.setViewName(JSP_PAGE+"list");
			
			return mv;
	}
	
	
	//Mysql 페이지 리스트 메소드
	public ModelAndView  mysqlPageList(SearchCriteria cri){
		
		ModelAndView mv =new ModelAndView();
		
		mv.addObject("list", boardService.mysqlListSearchCriteria(cri));
		
		PageMaker pageMaker =new PageMaker();
		pageMaker.setCri(cri);
		
		int count =boardService.mysqlListSearchCount(cri);
		pageMaker.setTotalCount(count);
		
		
		mv.addObject("pageMaker", pageMaker);
		mv.addObject("countList", count);
		mv.setViewName(JSP_PAGE+"mysql_list");
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
	public String viewDo(@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Integer bno, Model model, HttpSession session){
				
		model.addAttribute("vo", boardService.boardRead(bno, session));
		
		return   JSP_PAGE+"view";
	}
	
	
	
	//업데이트 화면 으로 가기
	@RequestMapping(value="/updateform.do", method=RequestMethod.GET)
	public String updateForm(
			@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Integer bno,   Model model){
		 BoardVO  vo = boardService.getBoard(bno);
		
		 model.addAttribute("vo", vo);
		
		return JSP_PAGE+"update";
	}
	
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(
			@ModelAttribute("cri") SearchCriteria cri,
			@ModelAttribute BoardVO vo){
		boardService.boardUpdate(vo);
		
		
		
		
		return "redirect:listAll.do"+cri.mysqlSearchQuery(cri.getPage());
	}
	

	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete(
			@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Integer bno){
		
		logger.info("삭제  :" + bno);
		boardService.boardDelete(bno);
		return "redirect:listAll.do";
	}
	
	
	
	
}



