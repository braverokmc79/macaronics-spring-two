package com.comlu.macaronics;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.comlu.macaronics.dto.GuestBookDTO;
import com.comlu.macaronics.dto.TblMember;
import com.comlu.macaronics.dto.TblUser;
import com.comlu.macaronics.mapper.GuestBookDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@WebAppConfiguration
public class MariadbSampleApplicationTests {

	
	private static final Logger log = LoggerFactory.getLogger(MariadbSampleApplicationTests.class);

	@Autowired
	GuestBookDAO dao ;
	
	
	@Test
	public void contextLoads()  {
	
	
		
	/*	List<TblUser> list2 =dao.list2();*/
		
		
		List<TblMember> list3=dao.list3();
		try{
		/*	 Connection conn =ds.getConnection();
			log.info("출력  :" + template);
			log.info(" ds  출력  :" + conn);
			*/		
			for(TblMember dto : list3){
				
				
				
				log.info(dto.toString());
			}
			
			log.info("출력 끝");	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	

}
