package com.macaronics.www.sample.dao;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {

	private static final Logger logger =LoggerFactory.getLogger(SampleAdvice.class);
	
	
	@Before(" execution ( * com.macaronics.www.sample.dto..*Impl.*(..))")
	public void startLog(){
		
		logger.info("------------------------");
		
		logger.info("------------------------");
	}
	
	
}
