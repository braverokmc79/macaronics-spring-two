package com.macaronics.www.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private final String JSP_PAGE ="/view/member/";
	
	private static final Logger logger =LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String memberList(Model model){	
		
		
		return "redirect:/admin/memberList.do";
	}
	
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String memberRegister(){
		
		return JSP_PAGE+"register";
	}
	
	
	
	@RequestMapping(value="/loginform.do", method=RequestMethod.GET)
	public String memberLoginForm(){
		
	//	logger.info(" loginform");
		
		
		return JSP_PAGE+"login";
	}


	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute MemberDTO  dto){
		
		logger.info("login" + dto.toString());
		
		return JSP_PAGE+"login";
	}
	
	
	
}

