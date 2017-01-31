package com.macaronics.www.user.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.admin.service.AdminCategoryService;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.service.ProductService;
import com.macaronics.www.user.service.QnAService;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping("/qna")
public class QnAController {
	
	private final String JSP_PAGE ="/view/qna/";
	
	private static final Logger logger =LoggerFactory.getLogger(QnAController.class);
	
	@Inject
	private QnAService qnAService;
	
	@Inject
	private AdminCategoryService adminCategoryService;
	
	@Inject
	private ProductService productService;
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String qanList(PageAndSearch pas, Model model){

		Integer count =qnAService.count();
		
	    if(pas.getCurPage() ==null){pas.setCurPage(1);}
		
		Pager.PAGE_SCALE=20;
		Pager pager =new Pager(count, pas.getCurPage());
		
		pas.setStart(pager.getPageBegin());
		pas.setEnd(pager.getPageEnd());
		List<UsersQandAVO> list=qnAService.list(pas);
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("pager", pager);

		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);
		
		
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		//조회수가 많은 상품을 가져온다.
		List<ProductShopVO> viewsProduct =productService.viewsProduct();
		model.addAttribute("vbp", viewsProduct);
		
		
		return JSP_PAGE+"list";
	}
	
	
	
	@RequestMapping(value="/read/{idx}", method=RequestMethod.GET)
	public String read(@PathVariable("idx") Integer idx, Model model){
		UsersQandAVO  vo=qnAService.getRead(idx);
		if(idx==null || vo==null){
			
			return "redirect:list";
		}
		
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		//조회수가 많은 상품을 가져온다.
		List<ProductShopVO> viewsProduct =productService.viewsProduct();
		model.addAttribute("vbp", viewsProduct);
		
		
		model.addAttribute("vo", vo);
		return JSP_PAGE+"read";
	}
	
	
	

	
	
	
}


