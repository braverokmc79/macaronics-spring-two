package com.macaronics.www;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MySQLConnectionTest {

	private static final String DRIVER ="com.mysql.jdbc.Driver";
	private static final String URL ="jdbc:mysql://localhost:3305/hamansuk?characterEncoding=utf8";
	private static final String USER = "1111";
	private static final String PW = "1111" ;

	private static final Logger logger =LoggerFactory.getLogger(MySQLConnectionTest.class);
	
	
	@Test
	public void testConnection() throws Exception{
		
		Class.forName(DRIVER);
		try(Connection  con =DriverManager.getConnection(URL, USER, PW)){
			
			System.out.println(con);
			//logger.info(con);
		}catch(Exception e){
			
		}
		
		
	}
	
	
}




