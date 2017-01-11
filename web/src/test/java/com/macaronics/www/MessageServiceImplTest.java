package com.macaronics.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.macaronics.www.sample.dto.UserVO;
import com.macaronics.www.sample.service.MessageServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MessageServiceImplTest {

	@Inject
	MessageServiceImpl service;
	
	private static final Logger logger =LoggerFactory.getLogger(MessageServiceImplTest.class);
	
	@Test
	public void test() {
		
		try{
		
			List<UserVO> vo =service.userList();
			for(UserVO v : vo){
				logger.info("  dto  : " + v.toString());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	

}
