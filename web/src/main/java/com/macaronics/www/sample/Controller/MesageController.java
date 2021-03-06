package com.macaronics.www.sample.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.macaronics.www.admin.service.AdminCategoryService;
import com.macaronics.www.sample.dto.MessageVO;
import com.macaronics.www.sample.dto.UserVO;
import com.macaronics.www.sample.service.MessageService;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.service.ProductService;

@Controller
@RequestMapping("/messages")
public class MesageController {

	@Inject
	private MessageService service;
	
	@Inject
	private ProductService productService;
	
	
	@Inject
	private AdminCategoryService adminCategoryService;
	
	private String JSP_URL ="/view/messages/";
	
	
	Logger logger =LoggerFactory.getLogger(MesageController.class);
	
	
	
	@RequestMapping(value="/messageform", method=RequestMethod.GET)
	public String messageForm(Model model) throws Exception{
		
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		//조회수가 많은 상품을 가져온다.
		List<ProductShopVO> viewsProduct =productService.viewsProduct();
		model.addAttribute("vbp", viewsProduct);
		
		
		
		
		model.addAttribute("userList", service.userList());
		model.addAttribute("messageList", service.messageList());
		return JSP_URL+"messageform";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/addmessage", method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addMessage(@RequestBody MessageVO vo){
		
		ResponseEntity<Map<String , Object>>  entity =null;
		try{
			service.addMessage(vo);
			List<UserVO> userList=service.userList();
			
			List<MessageVO> messageList=service.messageList();
			
			Map<String , Object> map =new HashMap<>();
			map.put("userList", userList);
			map.put("messageList", messageList);
			
			
			entity=new ResponseEntity<Map<String , Object>> (map , HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<Map<String , Object>> ( HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	
	
}



