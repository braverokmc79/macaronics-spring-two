package com.macaronics.www.util.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component //스프링에서 관리하는 bean
@Aspect //aop bean
public class LogAdvice {

	//로그 수집 객체
	private static final Logger logger =LoggerFactory.getLogger(LogAdvice.class);
	
	@Pointcut("execution( * com.macaronics.www.member.controller..*Controller.*(..))"
			+ " or execution( * com.macaronics.www.member.model.dao.board..*Impl.*(..))"
			+ " or execution( * com.macaronics.www.member.service.board..*Impl.*(..))" 
			 + " or execution( * com.macaronics.www.admin.controller..*Controller.*(..))" )
    public void logging() {   
    	
    	
    }
 
//ProceedingJoinPoint 클래스는 around 에서 만 가능 
	//@Around("logging()")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable{
		
		long start =System.currentTimeMillis();
		Object result =joinPoint.proceed();
		
		String type =joinPoint.getSignature().getDeclaringTypeName();
		
		String name="";
		
		if(type.indexOf("Controller") > -1){
			name ="Controller \t : ";
		}else if(type.indexOf("Service") > -1){
			name ="ServiceImpl \t: ";
		}else if(type.indexOf("DAO") > -1){
			name ="DAO \t: ";
		}
		//클래스  +  매소드 이름
		logger.info( "*******" + name+type+"."+joinPoint.getSignature().getName() +"()");
	

		//파라미터 값
		logger.info(Arrays.toString(joinPoint.getArgs()));
		
		long end =System.currentTimeMillis();
		long time =end-start;
		logger.info(result +" 실행시간 :" + time);
		
		return joinPoint.proceed();
	}
	
	
	 @Before("logging()")
	 public void logBefore(JoinPoint joinPoint){
		
	  	String jpinpointName =joinPoint.getSignature().getName();
	  	
		
		String type =joinPoint.getSignature().getDeclaringTypeName();
		
		String name="";
		
		if(type.indexOf("Controller") > -1){
			name ="Controller \t : ";
		}else if(type.indexOf("Service") > -1){
			name ="ServiceImpl \t: ";
		}else if(type.indexOf("DAO") > -1){
			name ="DAO \t: ";
		}
		//클래스  +  매소드 이름
		logger.info("jpinpointName :" +
		jpinpointName +" *******  ****** " + name+type+"."+joinPoint.getSignature().getName() +"()");
	

	 }
 
	
}
