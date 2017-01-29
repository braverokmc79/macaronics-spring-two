package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminPromotionsVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface AdminPromotionsDAO {

	
	public List<AdminPromotionsVO> getPromotionsList(int start, int end, PageAndSearch pas) throws Exception;
	
	public void promotionsInsert(AdminPromotionsVO vo) throws Exception;
	
	public void promotionsUpdate(AdminPromotionsVO vo) throws Exception;
	
	public void promotionsDelete(Integer idx) throws Exception;

	public AdminPromotionsVO promotionsUpdateForm(Integer idx) throws Exception;

	public int countArticle(String search_option, String keyword) throws Exception;
	
	
	
}
