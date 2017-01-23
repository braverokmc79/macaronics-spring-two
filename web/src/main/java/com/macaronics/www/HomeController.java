package com.macaronics.www;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import com.macaronics.www.admin.model.dto.AdminCategoryVO;
import com.macaronics.www.admin.model.dto.AdminRecommendedVO;
import com.macaronics.www.admin.service.AdminCategoryService;
import com.macaronics.www.admin.service.AdminRecommendedService;
import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.user.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Inject
	private HomeService homeService;
	
	
	
	@Inject
	private AdminCategoryService adminCategoryService;

	@Inject
	private AdminRecommendedService adminRecommendedService;
	
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, AdminRecommendedVO vo) {
		logger.info("Welcome home! The client locale is {}.", locale);
	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		// 기본 값 = 1
		Integer currProductId =adminRecommendedService.getProductId(vo);
		
		Map<String, Object> map =new HashMap<>();
		map.put("newProductList", homeService.newProudctList());
		map.put("bestProductList", homeService.bestProductList());
		map.put("eventProductList", homeService.eventProductList());
		map.put("recommendProduct", adminRecommendedService.detailProduct(currProductId));
		
		model.addAttribute("map", map);
		
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		model.addAttribute("serverTime", formattedDate );
		
		//쿠폰
		CouponVO  couponVO=homeService.lastCouponProduct();
		model.addAttribute("couponVO", couponVO);
		
		return "home";
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
	
	
	
	
}





