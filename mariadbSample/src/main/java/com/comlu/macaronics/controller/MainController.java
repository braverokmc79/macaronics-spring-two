package com.comlu.macaronics.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	
	//@Inject
	//private GuestBookService guestBookService;
	
	
	@RequestMapping("/")
	public ModelAndView main(ModelAndView mav){
		
		mav.setViewName("main"); //main.html
		mav.addObject("message", "환영합니다.");
		
		//mav.addObject("list", guestBookService.list());
		return mav;
	}
	
	
	
	
}
