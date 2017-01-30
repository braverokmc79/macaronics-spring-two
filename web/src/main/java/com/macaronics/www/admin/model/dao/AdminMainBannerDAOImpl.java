package com.macaronics.www.admin.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminMainBannerVO;


@Repository
public class AdminMainBannerDAOImpl implements AdminMainBannerDAO{

	
	private static final Logger logger=LoggerFactory.getLogger(AdminMainBannerDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	private final String namespace=SqlServerEnvironment.SQL+".adminMainBannerMapper";
	
	
	@Override
	public List<AdminMainBannerVO> mainBannerList() {
		return sqlSession.selectList(namespace+".mainBannerList" );
	}

	
	@Override
	public AdminMainBannerVO getMainBanner(Integer idx) {
		return sqlSession.selectOne(namespace+".getMainBanner", idx);
	}

	
	@Override
	public void mainBannerInsert(AdminMainBannerVO vo) {
		sqlSession.insert(namespace+".mainBannerInsert", vo);
	}

	@Override
	public void mainBannerUpdate(AdminMainBannerVO vo) {
		sqlSession.update(namespace+".mainBannerUpdate", vo);
	}

	@Override
	public void mainBannerDelete(Integer idx) {
		sqlSession.delete(namespace+".mainBannerDelete", idx);	
	}


	@Override
	public int mainBannerCount() {
		
		return sqlSession.selectOne(namespace+".mainBannerCount");
	}

	
	
	
}
