package com.macaronics.www.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogOutIntercepor extends HandlerInterceptorAdapter{

	
	private static final Logger logger =LoggerFactory.getLogger(LogOutIntercepor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session =request.getSession();
		//로그 아웃으로 가기전 uri 정보 저장
		if(session.getAttribute("loginUser")!=null){
			//logger.info("LogOut current ");
			
			// 현재 uri 정보 저장
		//	saveDest(request);
		}
		return true;
	}
	
	
	private void saveDest(HttpServletRequest request){
		
		String uri =request.getRequestURI();
		String query =request.getQueryString();
		
		if(query==null || query.equals("null")){
			query="";
		}else{
			query ="?"+query;
		}
		
		if(request.getMethod().equals("GET")){
		//	logger.info("dest : " +(uri +query));
			request.getSession().removeAttribute("dest");
			request.getSession().setAttribute("dest", uri+query);
		}
	}
	
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//dest 세션 객체를 가져와 원래 보던 페이로 이동
	/*	HttpSession session=request.getSession();
		String dest =(String)session.getAttribute("dest");
		
		
		session.invalidate();
		response.sendRedirect(dest !=null ? (String)dest: "/");*/
	}
	
	
}
