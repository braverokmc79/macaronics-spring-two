package com.macaronics.www.util.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.macaronics.www.SqlServerEnvironment;

public class SampleInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger=LoggerFactory.getLogger(SampleInterceptor.class);

	
	
	//요청 전 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setAttribute("ServerEnvironment", SqlServerEnvironment.SQL );
		
		saveDest(request);
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
		//	logger.info("logoutDest : " +(uri +query));
				
			//로그아웃 페이지면 저장 하지 않는다.
			String saveDest =uri+query;
			
			//displayFile 이미지를 뜻하는 uri 가 있으면 저장 하지 않는다.
			if(saveDest.equals("/member/logout") || saveDest.equals("/member/loginform.do")
				|| saveDest.equals("/member/login.do") || !saveDest.contains(".do")){	
				//저장 하지 않는다.
			}else{
				request.getSession().setAttribute("dest", saveDest);
			//	logger.info("saveLogoutDest : " +(uri +query));
			}
		}
	}
	
	
	//요청 후에 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
	}

	
	
	
	
		
}
