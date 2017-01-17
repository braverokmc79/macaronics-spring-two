package com.macaronics.www.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.admin.model.dto.AdminLoginVO;
import com.macaronics.www.admin.service.AdminLoginService;
import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.util.passwordencoder.PasswordEncoding;

@Controller
@RequestMapping(value="/adminconfirm")
public class AdminLoginController {

	private static final String JSP_PAGE="/admin/login/";
	
	private static final Logger logger =LoggerFactory.getLogger(AdminLoginController.class);
	
	
	@Inject
	private PasswordEncoding passwordEncoding;
	
	@Inject
	private AdminLoginService adminLoginService;
	
	@RequestMapping(value="/loginform.do", method=RequestMethod.GET)
	public String adminLoginForm(){

		return  JSP_PAGE+"login";
	}

	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String adminLoginAction(@ModelAttribute AdminLoginVO  vo,
			HttpSession session, RedirectAttributes rttr){
		
		//이메일만 들어가서 널인지 아닌지 확인, 비밀번호를 가져온다. 
		//아직 암호된 비밀 번호은 확인 못한다.
		AdminLoginVO admin =adminLoginService.loginCheck(vo);	
		if(admin!=null){
			
				// 널이 아니면  이메일이 존재 하면 등록된 가입자 이다.
	
			//패스워드 매치를 통해 다시 확인 한다
			if(passwordEncoding.matches(vo.getUserpw(), admin.getUserpw())){
				// 로그인이 가능한 유저 확인
				
				logger.info(" admin 정보  " + admin.toString());
				
				
				admin =adminLoginService.getLoginInfo(vo.getEmail());
				//가져온 member 를 세션에 저장한다.
				session.setAttribute("loginAdmin",  admin);
			
				return "redirect:/admin/index" ;
			
			}else{			
				//비밀 번호 오류	
				rttr.addFlashAttribute("messageEmail", vo.getEmail());
				rttr.addFlashAttribute("errorMessage", "비밀 번호가 틀립니다.");
				return "redirect:loginform.do";
			}						
	
		}
		
		//등록 되지 않은 이메일
		rttr.addFlashAttribute("errorMessage", "등록되지 않은 이메일 입니다.");
		return "redirect:loginform.do";				
	}
	
	
	
	
	
}




