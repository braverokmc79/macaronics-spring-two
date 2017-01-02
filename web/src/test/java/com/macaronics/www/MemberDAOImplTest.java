package com.macaronics.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.macaronics.www.member.model.dao.MemberDAO;
import com.macaronics.www.member.model.dto.MemberDTO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDAOImplTest {

	@Inject
	
	MemberDAO  dao;
	
	private static final Logger logger=LoggerFactory.getLogger(MemberDAOImplTest.class);
	

	@Test
	public void testInsertMember() {
		
		MemberDTO dto =new MemberDTO();
		dto.setEmail("qpeet@gmail.com");
		dto.setUsername("김하늘");
		dto.setUserpw("1111");
		dto.setUserid("none");
		dao.insertMember(dto);
	}

	
	@Test
	public void testMemberList() {

	}
	
	@Test
	public void testViewMember() {
			logger.info(" testViewMember  :" + dao.viewMember("none").toString());
	}

	@Test
	public void testDeleteMember() {
	
	}

	@Test
	public void testUpdateMember() {
		
	}

	@Test
	public void testUserAndEmailConfirm() {
	
	}

	@Test
	public void testCheckPwd() {
		
	}

}
