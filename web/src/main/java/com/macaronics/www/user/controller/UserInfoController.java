package com.macaronics.www.user;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.service.MemberService;

@Controller
@RequestMapping(value="/users")
public class UserInfoController {

	private static final String JSP_PAGE ="/users/";
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String index(){
		
		return "/users/index";
	}
	
	
	
	@RequestMapping(value="/userinfo", method=RequestMethod.GET)
	public String userInfo(@ModelAttribute MemberDTO dto){
		
		memberService.viewMember(dto.getUserid());
		
		return JSP_PAGE+"/member/userinfo";
	}
	
	
}
