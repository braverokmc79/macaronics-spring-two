package com.comlu.macaronics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	
	
	@RequestMapping("/hello")
	public String index(Model model) {
		model.addAttribute("name", "SpringBlog from Millky");
		return "hello";
	}
	
	
	@RequestMapping("/member/login")
	public String login(){
		
		return  "/member/login";
	}
	
	
	@RequestMapping("/member/logout")
	public String logout(){
		
		return  "/member/logout";
	}
	
	
	
	
}