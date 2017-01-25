package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.admin.model.dto.AdminEmailVO;
import com.macaronics.www.util.oralce.PageAndSearch;

public interface AdminEmailDAO {

	
	public void senderEmail(AdminEmailVO vo);
	
	public List<AdminEmailVO> emailList(PageAndSearch pas);
	
	public void deleteEmail(Integer idx);

	public int emailCount(PageAndSearch pas);
	
	
	
}
