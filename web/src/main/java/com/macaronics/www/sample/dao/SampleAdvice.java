package com.macaronics.www.sample.dao;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {

	private static final Logger logger =LoggerFactory.getLogger(SampleAdvice.class);
	
	
	@Around("execution( * com.macaronics.www.sample.service.MessageService*.*(..))")
	public Object timeLog (ProceedingJoinPoint pjp) throws Throwable{
		
		long start =System.currentTimeMillis();
		
		Object result=pjp.proceed();
		
		long end=System.currentTimeMillis();
	
		logger.info(pjp.getSignature().getName()
				+ ":" +(end-start));
		
		logger.info("================MessageService ================");
		
		return result;
	}
	
	
	
	
	
	
	
	
}
