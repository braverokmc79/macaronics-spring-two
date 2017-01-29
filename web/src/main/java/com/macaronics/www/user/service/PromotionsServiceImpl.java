package com.macaronics.www.user.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.user.model.dao.PromotionDAO;
import com.macaronics.www.user.model.dto.PromotionVO;


@Service
public class PromotionsServiceImpl implements PromotionsService {
	
	
	private final static Logger logger =LoggerFactory.getLogger(PromotionsServiceImpl.class);
	
	@Inject
	private PromotionDAO promotionDAO;
	
	
	@Transactional
	@Override
	public PromotionVO getRead(Integer idx) {
		PromotionVO vo =null;
		try {
			vo=promotionDAO.getRead(idx);
			
			//카우터 증가
			promotionDAO.viewCoutUpdate(idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}
