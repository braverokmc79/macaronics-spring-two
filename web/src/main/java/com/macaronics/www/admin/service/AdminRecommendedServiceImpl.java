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
	public Integer getProductId(AdminRecommendedVO vo) {
		Integer id=null;
		try {
			id=adminRecommendedDAO.getProductId(vo);
		} catch (Exception e) {
			
		}
			
		return id;
	}
	
	
	
	public ProductShopVO detailProduct(Integer product_id){
		ProductShopVO vo =null;
		try{
			if(product_id!=null){	
				vo =adminRecommendedDAO.detailProduct(product_id);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return vo;
	}
	
	
	
}
