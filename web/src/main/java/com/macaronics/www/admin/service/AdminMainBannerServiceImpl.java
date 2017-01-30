package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminMainBannerDAO;
import com.macaronics.www.admin.model.dto.AdminMainBannerVO;


@Service
public class AdminMainBannerServiceImpl implements AdminMainBannerService {

	
	@Inject
	private AdminMainBannerDAO adminMainBannerDAO;
	
	private static final Logger logger =LoggerFactory.getLogger(AdminMainBannerServiceImpl.class);
	
	
	
	@Override
	public List<AdminMainBannerVO> mainBannerList() {
		List<AdminMainBannerVO> list=null;
		try {
			list=adminMainBannerDAO.mainBannerList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	@Override
	public AdminMainBannerVO getMainBanner(Integer idx) {
		AdminMainBannerVO vo =null;
		try {
			vo=adminMainBannerDAO.getMainBanner(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	

	@Override
	public void mainBannerInsert(AdminMainBannerVO vo) {
		try {
			adminMainBannerDAO.mainBannerInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void mainBannerUpdate(AdminMainBannerVO vo) {
		try {
			adminMainBannerDAO.mainBannerUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void mainBannerDelete(Integer idx) {
		try {
			adminMainBannerDAO.mainBannerDelete(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}


	@Override
	public int mainBannerCount() {
		// TODO Auto-generated method stub
		return adminMainBannerDAO.mainBannerCount();
	}

		
}


