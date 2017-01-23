package com.macaronics.www.user.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.user.model.dao.CouponDAO;
import com.macaronics.www.user.model.dto.CouponVO;


@Service
public class CouponServiceImpl implements CouponService {

	private final static Logger logger =LoggerFactory.getLogger(CouponServiceImpl.class);
	
	@Inject
	private CouponDAO couponDAO;
	
	
	@Transactional
	@Override
	public CouponVO getRead(Integer idx) {
		CouponVO vo =null;
		try {
			vo=couponDAO.getRead(idx);
			
			//카우터 증가
			couponDAO.viewCoutUpdate(idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	
	
}


