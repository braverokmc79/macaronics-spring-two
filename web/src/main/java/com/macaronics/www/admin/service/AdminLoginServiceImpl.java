package com.macaronics.www.admin.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminLoginDAO;
import com.macaronics.www.admin.model.dto.AdminLoginVO;


@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminLoginService.class);
	
	@Inject
	private AdminLoginDAO adminLoginDAO;
	
	
	@Override
	public AdminLoginVO loginCheck(AdminLoginVO vo) {
		AdminLoginVO admin=null;
		try{
			//logger.info( "loginCheck 파라미터 값 : " +vo.toString());
			admin=adminLoginDAO.loginCheck(vo);
			//logger.info("loginCheck  넘겨 온 DB:" + admin.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return admin;
	}


	@Override
	public AdminLoginVO getLoginInfo(String email) {
		AdminLoginVO admin=null;
		try{
			admin=adminLoginDAO.getLoginInfo(email);
		}catch(Exception e){
			e.printStackTrace();
		}
		return admin;
	}
	
	
	
	
	

}
