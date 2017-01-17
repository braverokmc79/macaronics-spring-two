package com.macaronics.www.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/shop/products")
public class AdminShopProductController {

	
	private static final String JSP_PAGE ="/admin/shop/products/";
	
	
	@RequestMapping(value="/write.do")
	public String productRegisterDo(){
		
		
		return JSP_PAGE+"write";
	}
	
	
	
}
