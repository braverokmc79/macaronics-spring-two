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
		  //대표 이미지 설정 
		    for(int i=0; i<files.length; i++){
			   	if(i==0){
			   		vo.setPicture_url(files[i]);
			   	}
			   	
			 }
		    
		    //태그 제거
		    String descritpion=XssDefender.removeTag(vo.getDescription());
		    vo.setDescription(descritpion);
		    
		    adminShopProductDao.productInsert(vo);
		    
		    //첨부파일 등록
		    for(String file :files){
		    	//adminShopProductDao.addAttach(file);
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


	@Override
	public void delteAttachImg(String fullname) {
		
		adminShopProductDao.delteAttachImg(fullname);
	}


	@Transactional
	@Override
	public void updateProduct(ProductShopVO vo) {
		
		try{
			
			String[] files =vo.getMfiles();
		  //대표 이미지 설정 
		    for(int i=0; i<files.length; i++){
			   	if(i==0){
			   		vo.setPicture_url(files[i]);
			   	}
			   	
			 }
		    adminShopProductDao.updateProduct(vo);
		    
		    //DB에 있는 기존  첨부 파일 삭제
		    Integer product_id =vo.getProduct_id();
		    
		    adminShopProductDao.deleteAttach(product_id);
		    
		    String[] files2 =vo.getMfiles();
		    if(files2 ==null){
		    	return;
		    }
		    //DB에 파일 다시 첨가
		    for(String fileName :files){
		    	adminShopProductDao.replaceAttach(fileName, product_id);
		    }
		    
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Transactional
	@Override
	public void productDelete(Integer product_id) {
		
		try{
			
			//상품 삭제
			adminShopProductDao.productDelete(product_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	//구매 중인 상품이 있는지 확인
	@Override
	public int productOrederConfirm(Integer product_id) {
		// TODO Auto-generated method stub
		return adminShopProductDao.productOrederConfirm(product_id);
	}


	@Override
	public void deleteAttach(Integer product_id) {
		try {
			adminShopProductDao.deleteAttach(product_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	
	
	
}
