package com.macaronics.www.user.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.macaronics.www.user.service.CartService;

@Controller
@RequestMapping("/shop/order")
public class OrderController {

	private static final Logger logger=LoggerFactory.getLogger(CartController.class);
	
	private static final String JSP_PAGE = "/view/order/";
	
	@Inject
	private CartService cartService;
	
	
	
	
	
	
}
