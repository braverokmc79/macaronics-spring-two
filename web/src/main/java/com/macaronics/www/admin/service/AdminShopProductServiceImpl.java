package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.admin.model.dao.AdminShopProductDAO;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.util.xss.XssDefender;
@Service
public class AdminShopProductServiceImpl implements AdminShopProductService {

	private static final Logger logger =LoggerFactory.getLogger(AdminShopProductServiceImpl.class);
	
	@Inject
	private AdminShopProductDAO  adminShopProductDao;
	
	
	@Transactional
	@Override
	public void productInsert(ProductShopVO vo) {
		try{
					
			String[] files =vo.getMfiles();
		   
		    for(int i=0; i<files.length; i++){
			   	if(i==0){
			   		vo.setPicture_url(files[i]);
			   	}
			   	
			 }
		    String descritpion=XssDefender.inputString(vo.getDescription());
		    vo.setDescription(descritpion);
		    adminShopProductDao.productInsert(vo);
		    
		    
		    for(String file :files){
		    	adminShopProductDao.addAttach(file);
		    }
	 
	
		}catch(Exception e){
			e.printStackTrace();
		}
	}


	@Override
	public List<ProductShopVO> productList() {
		// TODO Auto-generated method stub
		return adminShopProductDao.productList();
	}

	
	
	
	
	
}
