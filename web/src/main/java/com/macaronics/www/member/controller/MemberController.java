package com.macaronics.www.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.service.MemberService;
import com.macaronics.www.util.passwordencoder.PasswordEncoding;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private final String JSP_PAGE ="/view/member/";
	
	private static final Logger logger =LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	
	@Inject
	PasswordEncoding passwordEncoding;
	
	
	
	
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
	public String memberLogin(@ModelAttribute MemberDTO  dto , HttpSession session , RedirectAttributes rttr){
		
		logger.info("login" + dto.toString());
		
		//이메일 체크 후 정보를 가져 온다.
		MemberDTO  member =memberService.checkLogin(dto);
		logger.info("DB 암호 해독   패스워드 " +  member.getUserpw());
		logger.info("유저 아이디   " +  member.getUserid());
		if(member !=null){
			// 널이 아니면  이메일이 존재 하면 등록된 가입자 이다.
			
			//패스워드 매치를 통해 다시 확인 한다
			if(passwordEncoding.matches(dto.getUserpw(), member.getUserpw())){
				// 로그인이 가능한 유저 확인
				
				MemberDTO loginUser = memberService.viewMember(member.getUserid());
				//가져온 member 를 세션에 저장한다.
				session.setAttribute("loginUser",  loginUser);
				return "redirect:/";
			
			}else{			
				//비밀 번호 오류	
				rttr.addFlashAttribute("messageEmail", dto.getEmail());
				rttr.addFlashAttribute("errorMessage", "비밀 번호가 틀립니다.");
				return "redirect:loginform.do";
			}
						
		}else{
			//등록 되지 않은 이메일
			rttr.addFlashAttribute("errorMessage", "등록되지 않은 이메일 입니다.");
			return "redirect:loginform.do";		
		}
	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String memberLogOut(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
}

