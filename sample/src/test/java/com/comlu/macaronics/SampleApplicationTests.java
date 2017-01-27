package com.comlu.macaronics;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.comlu.macaronics.dao.FacebookFeedDAO;
import com.comlu.macaronics.dto.FacebookFeedVO;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@WebAppConfiguration
public class SampleApplicationTests {

	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FacebookFeedDAO dao;
	
	//@Test
	public void contextLoads() throws SQLException {
	
		System.out.println(ds);
		
		Connection con =ds.getConnection();
		System.out.println(con);
		
		con.close();
		
		
		
	}
	
	
	@Test
	public void test() {
		
		try{
			
			System.out.println(" SSSS SSSSSSSSSSSSSSSSSSSSSSSSSS :" +sqlSession);
			
			FacebookFeedVO vo =new FacebookFeedVO();
			vo.setIdx(1);
			vo.setId("dddd");
			vo.setMessage("dsdsd");
			vo.setName("");
			vo.setPicture("");
			vo.setCreated_time(new Date());
			dao.insert(vo);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}
	
	
	

}
