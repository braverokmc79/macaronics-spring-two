package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminChartDAO;
import com.macaronics.www.admin.model.dto.AdminChartVO;

@Service
public class AdminChartServiceImpl implements AdminChartService {


	private final static Logger logger =LoggerFactory.getLogger(AdminChartServiceImpl.class);
	
	@Inject
	private AdminChartDAO adminChartDAO;
	
	
	
	@Override
	public List<AdminChartVO> categoryNameAndCount() {
		List<AdminChartVO> list=null;
		
		try {
			list =adminChartDAO.categoryNameAndCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	
}
