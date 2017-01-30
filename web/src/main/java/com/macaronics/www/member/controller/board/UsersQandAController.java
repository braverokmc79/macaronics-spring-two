package com.macaronics.www.member.controller.board;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.member.service.board.UsersQandService;

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
	public String qnaList(HttpSession session, UsersQandAVO vo, Model model){
		MemberDTO member =(MemberDTO)session.getAttribute("loginUser");
	
		model.addAttribute("list", userQandService.qnaList(member.getUserid()));
		return JSP_PAGE +"qnaList";
	}
	
		
	
	
}






