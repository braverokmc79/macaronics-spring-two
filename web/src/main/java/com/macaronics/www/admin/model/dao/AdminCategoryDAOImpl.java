package com.macaronics.www.admin.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminCategoryVO;


@Repository
public class AdminCategoryDAOImpl implements AdminCategoryDAO {

	
	private static final Logger logger=LoggerFactory.getLogger(AdminCategoryDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=SqlServerEnvironment.SQL+"adminCategoryMapper";
	
	@Override
	public void categoryInsertOne(AdminCategoryVO vo) {	
		sqlSession.insert(namespace+".categoryInsertOne", vo);
	}

	
	@Override
	public List<AdminCategoryVO> categoryOneList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".categoryOneList");
	}


	@Override
	public void categoryOneUpdate(AdminCategoryVO vo) {
		sqlSession.update(namespace+".categoryOneUpdate", vo);
	}


	@Override
	public void categoryOneDelete(Integer idx) {
		sqlSession.delete(namespace+".categoryOneDelete" , idx);
		
	}


	@Override
	public void categoryInsertTwo(AdminCategoryVO vo) {
		sqlSession.insert(namespace+".categoryInsertTwo", vo);
		
	}


	@Override
	public List<AdminCategoryVO> categoryTwoList(Integer idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".categoryTwoList", idx);
	}


	@Override
	public void categoryTwoUpdate(AdminCategoryVO vo) {
		
		sqlSession.update(namespace+".categoryTwoUpdate", vo);
	}


	@Override
	public void categoryTwoDelete(Integer bno) {
		sqlSession.delete(namespace+".categoryTwoDelete", bno);
		
	}

	
	
	
	
	
	
	
}
