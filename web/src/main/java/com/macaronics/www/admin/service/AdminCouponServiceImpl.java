package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminCouponDAO;
import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.util.oralce.PageAndSearch;

@Service
public class AdminCouponServiceImpl implements AdminCouponService{

	
	private static final Logger logger=LoggerFactory.getLogger(AdminCouponServiceImpl.class);
	
	@Inject
	private AdminCouponDAO adminCouponDAO;
	
	

	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return adminCouponDAO.countArticle(search_option, keyword);
	}

	
	
	@Override
	public List<CouponVO> getCouponList(int start, int end, PageAndSearch pas) {
		
		List<CouponVO> list=null;
		try {
			
			list=adminCouponDAO.getCouponList(start, end ,pas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	
	@Override
	public void couponInsert(CouponVO vo) {
		try {
			adminCouponDAO.couponInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void couponUpdate(CouponVO vo) {
		try {
			adminCouponDAO.couponUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void couponDelete(Integer idx) {
		try {
			adminCouponDAO.couponDelete(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public CouponVO couponUpdateForm(Integer idx) {
		
		return adminCouponDAO.couponUpdateForm(idx);
	}



	
	
}
