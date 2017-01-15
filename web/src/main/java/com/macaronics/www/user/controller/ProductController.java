package com.macaronics.www.user.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.service.ProductService;

@Controller
@RequestMapping(value="/shop/products")
public class ProductController {

	private static final Logger logger =LoggerFactory.getLogger(ProductController.class);
	
	private static final String JSP_PAGE ="/view/products/";
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value="/list.do")
	public String productList(Model model) throws Exception{
		List<ProductShopVO> list=service.productList();
		
		for(ProductShopVO  vo : list){
			logger.info(" ********** " +vo.toString());
		}
		model.addAttribute("productList" ,list);
		return JSP_PAGE+"productList";
	}
	
	
	
	@RequestMapping(value="/detail.do/{product_id}")
	public ModelAndView productDetail(@PathVariable("product_id") Integer product_id
			, ModelAndView mav
			) throws Exception {
		
		mav.setViewName(JSP_PAGE+"/productDetail");
		mav.addObject("productDetail", service.detailProduct(product_id));
		
		return mav;
	}
	
	
	
	
	
	
}
