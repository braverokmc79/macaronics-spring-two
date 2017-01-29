package com.macaronics.www.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macaronics.www.admin.service.AdminCouponService;
import com.macaronics.www.admin.service.AdminPromotionsService;
import com.macaronics.www.user.service.CouponService;
import com.macaronics.www.user.service.PromotionsService;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping(value="/promotions")
public class PromotionsController {

	
	private final String JSP_PAGE ="/view/promotions/";
	
	private static final Logger logger =LoggerFactory.getLogger(CouponController.class);
	
	
	@Inject
	private PromotionsService promotionsService;
	
	@Inject
	private AdminPromotionsService adminPromotionsService;
	
	
	
	@RequestMapping(value="/read.do/{idx}", method=RequestMethod.GET)
	public String couponRead(@PathVariable("idx") Integer idx,   Model model){
	
		model.addAttribute( "promotion",  promotionsService.getRead(idx));
		
		return JSP_PAGE +"promotionsRead";
	}
	
	
	@RequestMapping(value="/promotionList.do", method=RequestMethod.GET)
	public String couponList(Model model, PageAndSearch pas) throws Exception{
		
		
		int count =adminPromotionsService.countArticle(pas.getSearch_option(), pas.getKeyword());
		
		//페이지 나누기 관련 처리
		if(pas.getCurPage()==null){pas.setCurPage(1);}
		

		Pager pager =new Pager(count, pas.getCurPage());
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		
		logger.info(" ****************   " + pas.toString() + "    메서드  : " + pas.searchQuery(1) +
				"  count : " + count + " start : " + start + "  end  : " + end);
		
		model.addAttribute("promotionList", adminPromotionsService.getPromotionsList(start, end,pas));
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("pager", pager);
	
		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);
		
		
		return JSP_PAGE+"promotionsList";
	}
	
	
	

}
