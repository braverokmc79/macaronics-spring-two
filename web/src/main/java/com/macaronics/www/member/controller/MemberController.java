package com.macaronics.www.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private final String FOLDER_PATH ="/view/member/";
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String memberList(Model model){	
		List<MemberDTO> list=memberService.memberList();
		model.addAttribute("list", list);
		
		return FOLDER_PATH+"member_list";
	}
	
	
	
	

	
	
}

