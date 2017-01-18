package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.admin.model.dao.AdminCategoryDAO;
import com.macaronics.www.admin.model.dto.AdminCategoryVO;


@Service
public class AdminCategoryServiceImpl implements AdminCategoryService {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminCategoryService.class);
	
	@Inject
	private AdminCategoryDAO adminCategoryDAO;
	
	
	//1차카테고리 등록
	@Override
	public void categoryInsertOne(AdminCategoryVO vo) {
		try {
			adminCategoryDAO.categoryInsertOne(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	//1차카테고리 리스트
	@Override
	public List<AdminCategoryVO> categoryOneList() {
		List<AdminCategoryVO> list=null;
		try {
			
			list=adminCategoryDAO.categoryOneList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public void categoryOneUpdate(AdminCategoryVO vo) {
		try{
			adminCategoryDAO.categoryOneUpdate(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	//1차 카테고리 삭제
	
	@Override
	public void categoryOneDelete(Integer idx) {
		adminCategoryDAO.categoryOneDelete(idx);
		
	}


	//2차카테고리 등록
	@Override
	public void categoryInsertTwo(AdminCategoryVO vo) {
		try {
			adminCategoryDAO.categoryInsertTwo(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//2차 카테고리 목록
	@Override
	public List<AdminCategoryVO> categoryTwoList(Integer idx) {
		List<AdminCategoryVO> list=null;
		try {
			
			list=adminCategoryDAO.categoryTwoList(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//2차 카테고리 업데이트
	@Override
	public void categoryTwoUpdate(AdminCategoryVO vo) {
		try{
			adminCategoryDAO.categoryTwoUpdate(vo);
		}catch(Exception e){
			e.printStackTrace();
		}	
	}


	//2차 카테고리 삭제
	@Override
	public void categoryTwoDelete(Integer bno) {
		try{
			adminCategoryDAO.categoryTwoDelete(bno);
		}catch(Exception e){
			e.printStackTrace();
		}
	}




	
	


}
