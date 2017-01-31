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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.member.service.board.UsersQandService;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping(value="/users/qna")
public class UsersQandAController {

	
	private final String JSP_PAGE ="/users/qa/";
	
	private static final Logger logger =LoggerFactory.getLogger(UsersQandAController.class);
	
	
	@Inject
	private UsersQandService userQandService;
	
	
	//등록 폼
	@RequestMapping(value="/registerform.do", method=RequestMethod.GET)
	public String qandaRegisterForm(HttpSession session ,UsersQandAVO vo , Model model){
		
		MemberDTO member =(MemberDTO)session.getAttribute("loginUser");

		vo.setUserid(member.getUserid());
		model.addAttribute("vo", vo);
		
		return JSP_PAGE+"register";
	}
	
	//읽기
	@RequestMapping(value="/read/{idx}", method=RequestMethod.GET)
	public String read(@PathVariable("idx") Integer idx, HttpSession session, Model model){
		MemberDTO member =(MemberDTO)session.getAttribute("loginUser");
		
		UsersQandAVO vo =userQandService.getQnA(idx, member.getUserid());
		if(idx==null || vo==null){
			return "redirect:qnaList";
		}
		model.addAttribute("vo",vo);
		return JSP_PAGE+"read";
	}
	
	
	
	
	//등록
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String qnaWrite(UsersQandAVO vo){
		
		if(vo.getSecret()==null){
			vo.setSecret("show");
		}
		logger.info(" 전송 폼 내용 : " + vo.toString());
		userQandService.qnaInsert(vo);
		return "redirect:qnaList";
	}
	
	
	//qna 리스트
	@RequestMapping(value="/qnaList", method=RequestMethod.GET)
	public String qnaList(HttpSession session, UsersQandAVO vo, PageAndSearch pas, Model model){
		MemberDTO member =(MemberDTO)session.getAttribute("loginUser");
	
		Integer count =userQandService.listCount(member.getUserid());
		
		if(pas.getCurPage() ==null){pas.setCurPage(1);}
		
		Pager.PAGE_SCALE=20;
		Pager pager =new Pager(count, pas.getCurPage());
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		pas.setStart(start);
		pas.setEnd(end);
		List<UsersQandAVO> list=userQandService.qnaList(member.getUserid(), pas);
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("pager", pager);

		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);

		
		return JSP_PAGE +"qnaList";
	}
	
	
	
}

