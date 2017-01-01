package com.macaronics.www.sample.Controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.sample.dto.ProductVO;

@Controller
@RequestMapping("/sample")
public class SampleController {

	private static final Logger logger =LoggerFactory.getLogger(SampleController.class);
	
	
	@RequestMapping("/doA")
	public String doA(Model model){
		
		logger.info("doA");
		
		model.addAttribute("message", "홈페이지에 오신것을 환영합니다.");
		return "redirect:doB";
	}
	
	@RequestMapping("/doB")
	public void doB(){
		logger.info("doB");
	}
	
	//ModelAndView : Model - 데이터 저장소, View 화면
	// 데이터와 포워드할 페이지의 정보
	@RequestMapping("/doC")
	public ModelAndView doC(){
		Map<String, Object> map 
				=new HashMap<String, Object>();
		//맵에 객체 저장
		map.put("product", new ProductVO("샤프", 1000));
		//new ModelAndView("view의 이름 ", "맵변수명", "맵");
		return new ModelAndView("doC", "map", map);
	}
	
	
	
	
	
}
