package com.macaronics.www.admin.model.dao;

import com.macaronics.www.admin.model.dto.AdminLoginVO;

public interface AdminLoginDAO {

	
	public AdminLoginVO loginCheck(AdminLoginVO vo);

	public AdminLoginVO getLoginInfo(String email);
	
	
}
