package com.macaronics.www.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.macaronics.www.admin.model.dto.AdminEmailVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface AdminEmailService {

	public void senderEmail(AdminEmailVO vo, HttpServletRequest request);
	
	public List<AdminEmailVO> emailList(PageAndSearch pas);
	
	public void deleteEmail(Integer idx);

	public int emailCount(PageAndSearch pas);
	
	
	
	
}
