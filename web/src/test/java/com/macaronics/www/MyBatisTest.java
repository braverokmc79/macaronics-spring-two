package com.macaronics.www;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MyBatisTest {

	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private SqlSessionFactory factory;
	
	@Inject
	private DataSource ds;
	
	private static final Logger logger=LoggerFactory.getLogger(MyBatisTest.class);
	
	@Test
	public void testDataSource(){
		try(Connection con =ds.getConnection()){
			
			logger.info("DataSource : " +con);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void testFactory(){
		logger.info( " SqlSessionFactory  : " +factory.toString());
	}
	
	
	//@Test
	public void mysqlTestSession() throws Exception {
	
		try (SqlSession session =factory.openSession()){
			logger.info("***********************MySQL************************");			
			logger.info( " sqlSession : " +sqlSession.toString());

			logger.info( " factory.openSession() : " +session.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	@Test
	public void oralceTestSession() throws Exception {
	
		try (SqlSession session =factory.openSession()){
			logger.info("***********************ORACLE************************");			
			logger.info( " sqlSession : " +sqlSession.toString());

			logger.info( " factory.openSession() : " +session.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}






