package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminCategoryVO;

public interface AdminCategoryDAO {

	
	public void categoryInsertOne(AdminCategoryVO vo);
	
	public List<AdminCategoryVO> categoryOneList();

	public void categoryOneUpdate(AdminCategoryVO vo);

	public void categoryOneDelete(Integer idx);
	
	
	
}
