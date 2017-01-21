package com.macaronics.www.admin.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.macaronics.www.admin.model.dto.AdminRecommendedVO;
import com.macaronics.www.admin.service.AdminRecommendedService;

@Controller
@RequestMapping(value="/admin/recommended")
public class AdminRecommendedController {

	
	
	private static final String JSP_PAGE ="/admin/shop/recommended/";
	
	private static final Logger logger=LoggerFactory.getLogger(AdminCategoryController.class);
	
	@Inject
	private AdminRecommendedService adminRecommendedService;
	
	
	@RequestMapping(value="/registerForm",  method=RequestMethod.GET)
	public String register(AdminRecommendedVO vo ,Model model){
		int num=adminRecommendedService.getProductId(vo);
		model.addAttribute("currentId" ,num);
		logger.info(" num  ------------ : " +num);
		return JSP_PAGE+"recommendwrite";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/confirmProductId", method=RequestMethod.POST)
	public ResponseEntity<String> confirmProductId(@RequestParam Integer product_id){
		
		ResponseEntity<String> entity =null;
		try{
			
			int count=adminRecommendedService.confirmProductId(product_id);
			logger.info(" count : " + count);
			if(count==0){
				entity =new ResponseEntity<String>("NOT", HttpStatus.OK);
			}else{
				entity =new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerProduct(@ModelAttribute AdminRecommendedVO vo){
		
		
		adminRecommendedService.registerProduct(vo);
		
		return "redirect:registerForm";
	}
	

	
	
}






