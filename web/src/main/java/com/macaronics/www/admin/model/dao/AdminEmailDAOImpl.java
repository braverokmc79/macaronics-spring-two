package com.macaronics.www.admin.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminEmailVO;
import com.macaronics.www.util.oralce.PageAndSearch;

@Repository
public class AdminEmailDAOImpl implements AdminEmailDAO {

	
	private final static Logger logger =LoggerFactory.getLogger(AdminEmailDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private final String namespace =SqlServerEnvironment.SQL+".amdinEmailMapper";
	
	
	@Override
	public void senderEmail(AdminEmailVO vo) {
		
		sqlSession.insert(namespace+".senderEmail", vo);
	}

	@Override
	public List<AdminEmailVO> emailList(PageAndSearch pas) {
		List<AdminEmailVO>  list=null;
		try{
			
			list=sqlSession.selectList(namespace+".emailList", pas);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteEmail(Integer idx) {
		
		sqlSession.delete(namespace+".deleteEmail", idx);
	}

	@Override
	public int emailCount(PageAndSearch pas) {
		
		return sqlSession.selectOne(namespace+".emailCount", pas);
	}

	
	
}
