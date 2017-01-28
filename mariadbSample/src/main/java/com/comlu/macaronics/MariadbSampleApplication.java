package com.comlu.macaronics;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;


//스프링 부트 애플리케이션 bean(시작 클래스)
@SpringBootApplication
//mapper 자동 스캔
@MapperScan(value={"com.comlu.macaronics.mapper"})
public class MariadbSampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(MariadbSampleApplication.class, args);
	}
	
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(
		DataSource dataSource) throws Exception{
		
		SqlSessionFactoryBean bean =new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		
/*		Resource[] res=new PathMatchingResourcePatternResolver()
					.getResources("classpath:mappers/*Mapper.xml");
		
		bean.setMapperLocations(res);
		*/
		return bean.getObject();
	}
	
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory){
		
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	
	
}


