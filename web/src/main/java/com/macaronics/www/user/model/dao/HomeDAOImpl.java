package com.macaronics.www.user.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.admin.model.dto.AdminMainBannerVO;
import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.model.dto.PromotionVO;


@Repository
public class HomeDAOImpl implements HomeDAO {

	private static String namespace=SqlServerEnvironment.SQL+"homeMapper";
	
	private static final Logger logger=LoggerFactory.getLogger(HomeDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<ProductShopVO> newProudctList() {
		
		return sqlSession.selectList(namespace+".newProudctList");
	}

	@Override
	public List<ProductShopVO> bestProductList() {
		
		return sqlSession.selectList(namespace+".bestProductList");
	}

	@Override
	public List<ProductShopVO> eventProductList() {
		
		return sqlSession.selectList(namespace+".eventProductList");
	}

	@Override
	public int couponLastProudctIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".couponLastProudctIdx");
	}

	@Override
	public CouponVO lastCouponProduct(Integer idx) {
	
		return sqlSession.selectOne(namespace+".lastCouponProduct", idx);
	}

	@Override
	public List<PromotionVO> promotionList() {
		// TODO Auto-generated method stub
		return  sqlSession.selectList(namespace+".promotionList");
	}

	@Override
	public List<AdminMainBannerVO> mainBannerList() {
		
		return sqlSession.selectList(namespace+".mainBannerList");
	}

	
	
}








