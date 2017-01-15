package com.macaronics.www.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.macaronics.www.member.model.dto.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN ="loginUser";
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info(" Loing postHandle");
		
	}
	
	
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session =request.getSession();
		if(session.getAttribute(LOGIN)!=null){
			// 로그인 전 기존에 남아 있는 정보 삭제
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	
	
}
