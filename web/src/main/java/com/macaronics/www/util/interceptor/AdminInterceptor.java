package com.macaronics.www.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.macaronics.www.member.model.dto.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info(" 관리자 화면 레벨 확인 ");
		
		HttpSession session =request.getSession();
		MemberDTO loginUser=(MemberDTO)session.getAttribute("loginUser");
		
		if(loginUser==null){
			response.sendRedirect("/member/loginform.do");
			return false;
		}else{			
			
			if(loginUser.getMember_level()==null){
				response.sendRedirect("/member/loginform.do");
				return false;
			}
			if(loginUser.getMember_level()<15){
				logger.info(" 접속 자 레벨 " +loginUser.getMember_level() );
				session.setAttribute("adminInterceptorMessage", "레벨 15 이상 관리자만 접근가능합니다.");
				response.sendRedirect("/");
				return false;
			}
		}	
		return true;
	}
	
	
	
	
	
}
