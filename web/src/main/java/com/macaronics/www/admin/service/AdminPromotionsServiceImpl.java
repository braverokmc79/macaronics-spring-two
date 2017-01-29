package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminPromotionsDAO;
import com.macaronics.www.admin.model.dto.AdminPromotionsVO;
import com.macaronics.www.util.oralce.PageAndSearch;


@Service
public class AdminPromotionsServiceImpl implements AdminPromotionsService {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminPromotionsServiceImpl.class);
	
	@Inject
	private AdminPromotionsDAO adminPromotionsDAO;
	
	
	@Override
	public List<AdminPromotionsVO> getPromotionsList(int start, int end, PageAndSearch pas) throws Exception {
		// TODO Auto-generated method stub
		return adminPromotionsDAO.getPromotionsList(start, end, pas);
	}

	@Override
	public void promotionsInsert(AdminPromotionsVO vo) throws Exception {
		adminPromotionsDAO.promotionsInsert(vo);
		
	}

	@Override
	public void promotionsUpdate(AdminPromotionsVO vo) throws Exception {
		
		adminPromotionsDAO.promotionsUpdate(vo);
	}

	@Override
	public void promotionsDelete(Integer idx) throws Exception {
		
		adminPromotionsDAO.promotionsDelete(idx);
	}

	@Override
	public AdminPromotionsVO promotionsUpdateForm(Integer idx) throws Exception {
		// TODO Auto-generated method stub
		return adminPromotionsDAO.promotionsUpdateForm(idx);
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return adminPromotionsDAO.countArticle(search_option, keyword);
	}

	
	


}
