package com.macaronics.www.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.util.oralce.PageAndSearch;

@Repository
public class AdminCouponDAOImpl implements AdminCouponDAO {

	
	private static final Logger logger= LoggerFactory.getLogger(AdminCouponDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=SqlServerEnvironment.SQL+"adminCouponMapper";
	
	
	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, Object> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne(namespace+".countArticle", map);
	}
	
	@Override
	public List<CouponVO> getCouponList(int start, int end, PageAndSearch pas){
		Map<String, Object> map =new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", pas.getSearch_option());
		map.put("keyword", pas.getKeyword());
		return sqlSession.selectList(namespace+".getCouponList",map);
	}

	
	
	@Override
	public void couponInsert(CouponVO vo) {
		sqlSession.insert(namespace+".couponInsert", vo);
	}

	@Override
	public void couponUpdate(CouponVO vo) {
		sqlSession.update(namespace+".couponUpdate", vo);
	}
	
	
	@Override
	public void couponDelete(Integer idx) {
		sqlSession.delete(namespace+".couponDelete", idx);
	}

	@Override
	public CouponVO couponUpdateForm(Integer idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".couponUpdateForm", idx);
	}




}





