package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.user.model.dao.HomeDAO;
import com.macaronics.www.user.model.dto.ProductShopVO;


@Service
public class HomeServiceImpl implements HomeService {

	@Inject
	private HomeDAO homedao;
	
	private static final Logger logger=LoggerFactory.getLogger(HomeServiceImpl.class);
	
	
	@Override
	public List<ProductShopVO> newProudctList() {
		
		List<ProductShopVO> list=null;
		try {
			list=homedao.newProudctList();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public List<ProductShopVO> bestProductList() {
		List<ProductShopVO> list=null;
		try {
			
			list=homedao.bestProductList();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public List<ProductShopVO> eventProductList() {
		List<ProductShopVO> list=null;
		try {
			list=homedao.eventProductList();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	
	
	
	
}
