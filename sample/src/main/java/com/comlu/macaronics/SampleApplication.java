package com.comlu.macaronics;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
//프로젝트 이름 + Application
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;


//스프링 부트의 메인 클래스
@SpringBootApplication
@MapperScan(value={"com.comlu.macaronics.dao"})
public class SampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SampleApplication.class, args);
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


