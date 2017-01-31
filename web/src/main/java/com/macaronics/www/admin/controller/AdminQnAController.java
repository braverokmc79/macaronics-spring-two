package com.macaronics.www.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.admin.service.AdminQnAService;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.member.service.board.UsersQandService;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping(value="/admin/qna")
public class AdminQnAController {
	
	private static final Logger logger =LoggerFactory.getLogger(AdminQnAController.class);
	
	private static String JSP_PAGE ="/admin/qna/";
	
	@Inject
	private AdminQnAService adminQnAService;
	
	
	//질문 - 답변대기 목록 
	@RequestMapping(value="/questionList", method=RequestMethod.GET)
	public String questionList(PageAndSearch pas, Model model){		
		
		String answer="uncheck";
		Integer count =adminQnAService.listCount(answer);
		
		if(pas.getCurPage() ==null){pas.setCurPage(1);}
		
		Pager.PAGE_SCALE=20;
		Pager pager =new Pager(count, pas.getCurPage());
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		pas.setStart(start);
		pas.setEnd(end);
		List<UsersQandAVO> list=adminQnAService.questionList(pas);
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("pager", pager);

		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);
		
		
		return JSP_PAGE+"questionList";
	}
	
	
	//답변 완료 목록
	@RequestMapping(value="/answerList", method=RequestMethod.GET)
	public String answerList(PageAndSearch pas, Model model){		
		
		String answer="check";
		Integer count =adminQnAService.listCount(answer);
		
		if(pas.getCurPage() ==null){pas.setCurPage(1);}
		
		Pager.PAGE_SCALE=20;
		Pager pager =new Pager(count, pas.getCurPage());
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		pas.setStart(start);
		pas.setEnd(end);
		List<UsersQandAVO> list=adminQnAService.answerList(pas);
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("pager", pager);

		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);
		
		
		return JSP_PAGE+"answerList";
	}
	
	
	
	
	
	//답변 폼
	@RequestMapping(value="/answerForm/{idx}", method=RequestMethod.GET)
	public String answerWriteForm(@PathVariable ("idx") Integer idx  , Model model){
		
		UsersQandAVO qnaVo = adminQnAService.getQnA(idx);
		
		if(qnaVo==null || idx==null){
			return "redirect:questionList"; 
		}
		model.addAttribute("vo", qnaVo);
		return JSP_PAGE+"answerForm";
	}
	
	
	
	//읽기
	@RequestMapping(value="/read/{idx}", method=RequestMethod.GET)
	public String read(@PathVariable ("idx") Integer idx  , Model model){
		
		UsersQandAVO qnaVo = adminQnAService.getQnA(idx);
		
		if(qnaVo==null || idx==null){
			return "redirect:questionList"; 
		}
		model.addAttribute("vo", qnaVo);
		return JSP_PAGE+"read";
	}
	
	
	
	
	
	//답변
	@RequestMapping(value="/answerWrite", method=RequestMethod.POST)
	public String answerWrite(UsersQandAVO vo ,Model model){
		
		logger.info(" 답변 등록 내용 :" + vo);
	
		//*******************  reorder 증가처리 ********************* 
		int ref =vo.getRef();
		int depth=vo.getDepth() +1; //답변 단계
		int reorder =vo.getReorder() +1; //같은 그룹내에서 순서
		
		
		//첫번째 DB에서  *******************  reorder  증가처리 *********************
				//게시물 내에서의 순서 조정 
				//(답변글) 현재 reorder 번호보다 큰것들은 1씩 증가로 셋팅 한다.
		adminQnAService.reorderUpdate(ref, reorder);
	   logger.info("리오더 1씩 증가 완료 :");
	   
	   
		//답변 게시글 테이블에 저장
	  
	    vo.setRef(ref);
	    vo.setDepth(depth);
	    vo.setReorder(reorder);
		String content ="<h3>질문 내용</h3>";
		content +=vo.getQcontent();
		content  +="<hr>";
		content +="<h3>답변 내용</h3>";
		content +=vo.getContent();
	    vo.setContent(content); //원본 게시글  + 답변 게시글	
	    adminQnAService.replyInsert(vo);
		
		return "redirect:answerList";
	}
	
	
	
	
	
	
	
	
}



