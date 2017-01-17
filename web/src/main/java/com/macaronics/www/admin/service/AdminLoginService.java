package com.macaronics.www.admin.service;

import com.macaronics.www.admin.model.dto.AdminLoginVO;

public interface AdminLoginService {

	public AdminLoginVO loginCheck(AdminLoginVO vo);

	public AdminLoginVO getLoginInfo(String email);

	
}
