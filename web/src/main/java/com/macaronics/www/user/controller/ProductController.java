package com.macaronics.www.user.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.admin.model.dto.AdminCategoryVO;
import com.macaronics.www.admin.service.AdminCategoryService;
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
	
	
	
	@Inject
	private AdminCategoryService adminCategoryService;

	
	
	@RequestMapping(value="/list.do")
	public String productList(Model model , PageAndSearch pas) throws Exception{
		
		int count =service.countArticle(pas.getSearch_option(), pas.getKeyword());
		
		//페이지 나누기 관련 처리
		if(pas.getCurPage()==null){pas.setCurPage(1);}
		
		

		if(pas.getShow()==null){
			Pager.PAGE_SCALE=20; //페이지당 20개씩 기본값
			pas.setShow(20);
		}else{
			Pager.PAGE_SCALE= pas.getShow();
		}
		if(pas.getSortby()==null || pas.getSortby().equals("")){
			pas.setSortby("product_id");
		}
		boolean sortby =false;
		//잘못된 입력 방지
		if(pas.getSortby().equals("product_id")||pas.getSortby().equals("product_name")||
				pas.getSortby().equals("price")||pas.getSortby().equals("regdate")){
			
			sortby=true;
		}
		
		if(!sortby){
			pas.setSortby("product_id");
		}
		
		
		Pager pager =new Pager(count, pas.getCurPage());
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		
		//List<BoardVO> list=boardService.boardList(start, end, pas.getSearch_option(), pas.getKeyword());
		List<ProductShopVO> list=service.productList(start, end, pas);
		
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("pager", pager);
	
		
		model.addAttribute("map",map);
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		//인기상품
		//조회수가 많은 상품을 가져온다.
		List<ProductShopVO> viewsProduct =service.viewsProduct();
		model.addAttribute("vbp", viewsProduct);
		
		model.addAttribute("pageAndSearch",pas);
		model.addAttribute("productList" ,list);
		return JSP_PAGE+"productList";
	}
	
	
	@RequestMapping(value="/detail.do/{product_id}")
	public ModelAndView productDetail(@PathVariable("product_id") Integer product_id
			, ModelAndView mav
			, RedirectAttributes rttr) throws Exception {
		
		ProductShopVO vo =service.detailProduct(product_id);
		
		if(vo ==null){	
			mav.addObject("productCodeErroMessage" , "등록된 상품이 없습니다.");
			mav.setViewName(JSP_PAGE+"/productDetail");
			return mav;
		}
		
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
		
		
		//1차 카테고리 목록 불러오기
		mav.addObject("categoryOne", adminCategoryService.categoryOneList());
		//다른 고객님들이 이 상품과 함께 구매하신 상품
		//3번 rno 카테고리가 같고  상품 을 가지고 온다 
		//logger.info("*****" + vo.toString());
		 List<ProductShopVO> togetherRecommendProduct =service.togetherRecommendProduct(vo.getCategory_rno()); 
		//인기상품
		//2번 카테고리가 같고 조회수가 많은 상품을 가져온다.
		 List<ProductShopVO> viewsBnoProduct =service.viewsBnoProduct(vo.getCategory_bno());
		 mav.addObject("trp", togetherRecommendProduct);
		 mav.addObject("vbp", viewsBnoProduct);
		return mav;
	}
	
	
	
	//2차 카테고리 불러오기
	@ResponseBody
	@RequestMapping(value="/categoryTwoList/{idx}", method=RequestMethod.GET)
	public ResponseEntity<List<AdminCategoryVO>> categoryTwoList(@PathVariable("idx") Integer idx){
		ResponseEntity<List<AdminCategoryVO>> entity=null;
		List<AdminCategoryVO> list=null;
		try{
			
			list =adminCategoryService.categoryTwoList(idx);
			
			entity=new ResponseEntity<List<AdminCategoryVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<List<AdminCategoryVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	//3차 카테고리 불러오기
	@ResponseBody
	@RequestMapping(value="/categoryThreeList/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<AdminCategoryVO>> categoryThreeList(@PathVariable("bno") Integer bno){
		ResponseEntity<List<AdminCategoryVO>> entity=null;
		List<AdminCategoryVO> list=null;
		try{
			
			list =adminCategoryService.categoryThreeList(bno);
			
			entity=new ResponseEntity<List<AdminCategoryVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<List<AdminCategoryVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	//3차 카테고리 모든 목록 불러오기
	@ResponseBody
	@RequestMapping(value="/categoryAllThreeList", method=RequestMethod.GET)
	public ResponseEntity<List<AdminCategoryVO>> categoryAllThreeList(){
		ResponseEntity<List<AdminCategoryVO>> entity=null;
		List<AdminCategoryVO> list=null;
		try{
			
			list =adminCategoryService.categoryAllThreeList();
			
			entity=new ResponseEntity<List<AdminCategoryVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<List<AdminCategoryVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	
	
}
