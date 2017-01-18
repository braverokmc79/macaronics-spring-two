package com.macaronics.www.admin.service;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminCategoryVO;

public interface AdminCategoryService {

	public void categoryInsertOne(AdminCategoryVO vo);
	
	
	public List<AdminCategoryVO> categoryOneList();


	public void categoryOneUpdate(AdminCategoryVO vo);


	public void categoryOneDelete(Integer idx);


	public void categoryInsertTwo(AdminCategoryVO vo);


	public List<AdminCategoryVO> categoryTwoList(Integer idx);


	public void categoryTwoUpdate(AdminCategoryVO vo);


	public void categoryTwoDelete(Integer bno);


	public void categoryInsertThree(AdminCategoryVO vo);
	
	public List<AdminCategoryVO> categoryThreeList(Integer bno);


	public void categoryThreeUpdate(AdminCategoryVO vo);


	public void categoryThreeDelete(Integer rno);
	
}
