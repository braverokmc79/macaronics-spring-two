package com.macaronics.www.admin.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminRecommendedDAO;
import com.macaronics.www.admin.model.dto.AdminRecommendedVO;
import com.macaronics.www.user.model.dto.ProductShopVO;

@Service
public class AdminRecommendedServiceImpl implements AdminRecommendedService {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminRecommendedServiceImpl.class);
	
	@Inject
	private AdminRecommendedDAO  adminRecommendedDAO;

	@Override
	public int confirmProductId(Integer product_id) {
		// TODO Auto-generated method stub
		return adminRecommendedDAO.confirmProductId(product_id);
	}

	@Override
	public void registerProduct(AdminRecommendedVO vo) {
		
		try{
			adminRecommendedDAO.registerProduct(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public int getProductId(AdminRecommendedVO vo) {
		// TODO Auto-generated method stub
		return adminRecommendedDAO.getProductId(vo);
	}
	
	
	
	public ProductShopVO detailProduct(Integer product_id){
		
		return adminRecommendedDAO.detailProduct(product_id);
	}
	
	
	
}
