package com.macaronics.www.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	
	private static final Logger logger =LoggerFactory.getLogger(AuthInterceptor.class);
	
	
	//로그인 한 유저만 접근 가능한 페이지
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session =request.getSession();
		
		if(session.getAttribute("loginUser")==null){
		
			logger.info("*********** current user is not loined  ***********");
			
			saveDest(request);
			
			response.sendRedirect("/member/loginform.do");
			return false;
		
		}
		return true;
	}
	
	
	
	
	private void saveDest(HttpServletRequest request){
		
		String uri =request.getRequestURI();
		logger.info("uri :"  + uri);
		String query =request.getQueryString();
		logger.info("query :"  + query);
		if(query==null || query.equals("null")){
			query="";
		}else{
			query ="?"+query;
		}
		
		if(request.getMethod().equals("GET")){
			logger.info("dest : " + (uri +query));
			request.getSession().setAttribute("dest", uri +query);
		}
	}
	
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
		HttpSession session=request.getSession();
/*	
		
		컨트롤러
		Object dest =session.getAttribute("dest");
		response.sendRedirect(dest !=null ? (String)dest : "/");
		
		*/
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	
	
}








