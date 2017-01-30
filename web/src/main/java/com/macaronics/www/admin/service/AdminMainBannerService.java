package com.macaronics.www.admin.service;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminMainBannerVO;

public interface AdminMainBannerService {

	
	
	public List<AdminMainBannerVO> mainBannerList();
	
	public AdminMainBannerVO getMainBanner(Integer idx);
	
	public void mainBannerInsert(AdminMainBannerVO vo);
	
	public void mainBannerUpdate(AdminMainBannerVO vo);
	
	public void mainBannerDelete(Integer idx);

	public int mainBannerCount();
	
	
}
