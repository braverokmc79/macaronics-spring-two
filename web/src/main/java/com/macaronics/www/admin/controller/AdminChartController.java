package com.macaronics.www.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.admin.model.dto.AdminChartVO;
import com.macaronics.www.admin.service.AdminChartService;

@Controller
@RequestMapping("/admin/chart")
public class AdminChartController {

	
	
	private static final Logger logger =LoggerFactory.getLogger(AdminChartController.class);
	
	private final String JSP_PAGE ="/admin/chart/";
	
	
	@Inject
	private AdminChartService adminChartService;
	
	
	
	@RequestMapping(value="/google")
	public ModelAndView Google(){
		
		return new ModelAndView(JSP_PAGE+"googleChart");
	}
	
	
	
	//{"변수명" :"값"}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="chartCategorylist", method=RequestMethod.GET)
	public JSONObject chartCategorylist(){
		
		List<AdminChartVO> items =adminChartService.categoryNameAndCount();
		//리턴할 json 객체
		JSONObject data =new JSONObject();
		//json의 컬럼 객체
		JSONObject col1 =new JSONObject();
		JSONObject col2=new JSONObject();
		//json 배열 객체
		JSONArray title = new JSONArray();
		col1.put("label", "카테고리명");
		col1.put("type", "string");
		col2.put("label", "개수");
		col2.put("type", "number");
		//타이틀행에 컬럼 추가
		title.add(col1);
		title.add(col2);
		
		//json 객체에 타이틀행 추가
		data.put("cols", title);
//{"cols":[{"label":"상품명","type":"string"}
//,{"label":"금액","type":"number"}]}		
		JSONArray body =new JSONArray();//rows
		for(AdminChartVO vo : items){
			JSONObject name =new JSONObject();
			name.put("v", vo.getCategory_name());//카테고리명
			JSONObject count=new JSONObject();
			count.put("v", vo.getProduct_count());//개수
			
			JSONArray row=new JSONArray();
			row.add(name);
			row.add(count);
			
			JSONObject cell =new JSONObject();
			cell.put("c", row);
			body.add(cell);			
		}
		data.put("rows", body);
		
		return data;
	}
	
	
	
	
	
}
