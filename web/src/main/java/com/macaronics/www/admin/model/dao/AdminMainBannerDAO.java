package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminMainBannerVO;

public interface AdminMainBannerDAO {

	
	public List<AdminMainBannerVO> mainBannerList();
	
	public AdminMainBannerVO getMainBanner(Integer idx);
	
	public void mainBannerInsert(AdminMainBannerVO vo);
	
	public void mainBannerUpdate(AdminMainBannerVO vo);
	
	public void mainBannerDelete(Integer idx);

	public int mainBannerCount();
	
	
	
}
