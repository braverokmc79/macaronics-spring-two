package com.macaronics.www.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.user.model.dto.CartVO;
import com.macaronics.www.user.service.CartService;

@Controller
@RequestMapping("/shop/cart")
public class CartController {

	private static final Logger logger=LoggerFactory.getLogger(CartController.class);
	
	
	private static final String JSP_PAGE = "/view/cart/";
	
	
	@Inject
	private CartService cartService;
	
	
	@ResponseBody
	@RequestMapping(value="/insert.do" , method=RequestMethod.POST)
	public ResponseEntity<String> productInsertDo(@RequestBody CartVO vo, HttpSession session){
	
		logger.info(" product_id : " + vo.getProduct_id() + "  amount : " +vo.getAmount());
		ResponseEntity<String> entity =null;
		try{
			MemberDTO dto=(MemberDTO)session.getAttribute("loginUser");
			vo.setUserid(dto.getUserid());
			cartService.insert(vo);
			entity =new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav){
		
		Map<String, Object> map =new HashMap<>();
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		List<CartVO> cartList= cartService.listCart(member.getUserid());
		for(CartVO vo :cartList){
			logger.info(" 0000  : " +vo.toString());
		}
		map.put("cartList", cartList);
		map.put("cartSize", cartList.size());
		mav.addObject("map", map);
		mav.setViewName(JSP_PAGE+"cart_list");
		return mav;
	}
	
	
	
}
