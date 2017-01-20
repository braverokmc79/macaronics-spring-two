package com.macaronics.www.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.service.ProductService;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping(value="/shop/products")
public class ProductController {

	private static final Logger logger =LoggerFactory.getLogger(ProductController.class);
	
	private static final String JSP_PAGE ="/view/products/";
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value="/list.do")
	public String productList(Model model , PageAndSearch pas) throws Exception{
		
		int count =service.countArticle(pas.getSearch_option(), pas.getKeyword());
		
		//페이지 나누기 관련 처리
		if(pas.getCurPage()==null){pas.setCurPage(1);}
		
		Pager.PAGE_SCALE=20; //페이지당 20개씩
		
		Pager pager =new Pager(count, pas.getCurPage());
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		
		//List<BoardVO> list=boardService.boardList(start, end, pas.getSearch_option(), pas.getKeyword());
		List<ProductShopVO> list=service.productList(start, end, pas.getSearch_option(), pas.getKeyword());
		
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("pager", pager);
	
		
		model.addAttribute("map",map);
		
		
		model.addAttribute("pageAndSearch",pas);
		model.addAttribute("productList" ,list);
		return JSP_PAGE+"productList";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/detail.do/{product_id}")
	public ModelAndView productDetail(@PathVariable("product_id") Integer product_id
			, ModelAndView mav
			) throws Exception {
		
		ProductShopVO vo =service.detailProduct(product_id);
		
		List<String>  attach=service.getAttach(product_id);
		List<String>  fullName=new ArrayList<>(); 
		for(String str :attach){
			String front =str.substring(0, 12);
			String end =str.substring(14);
			fullName.add(front+end);
		}
		
		
		mav.setViewName(JSP_PAGE+"/productDetail");
		mav.addObject("productDetail", vo);
		mav.addObject("fullName",fullName);
		return mav;
	}
	
	
	
	
	
	
}
