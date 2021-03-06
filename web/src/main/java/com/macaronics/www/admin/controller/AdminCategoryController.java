package com.macaronics.www.admin.controller;

import java.io.OutputStream;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.admin.model.dto.AdminCategoryVO;
import com.macaronics.www.admin.service.AdminCategoryService;

@Controller
@RequestMapping(value="/admin/category")
public class AdminCategoryController {

	
	private static final String JSP_PAGE ="/admin/shop/category/";
	
	private static final Logger logger=LoggerFactory.getLogger(AdminCategoryController.class);
	
	@Inject
	private AdminCategoryService adminCategoryService;
	
	
	
	@RequestMapping(value="/register")
	public String categoryForm(Model model){
	
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		return JSP_PAGE+"write";
	}
	
		
	
	//1차 카테고리 등록
	@RequestMapping(value="/categoryoneInsert", method=RequestMethod.POST)
	public String categoryOneInsertDo(AdminCategoryVO vo, RedirectAttributes rttr){
		
		logger.info("categoryOneInsertDo :  " + vo.toString());
		
		adminCategoryService.categoryInsertOne(vo);
		rttr.addFlashAttribute("message", "등록 되었습니다.");
		return "redirect:register.do";
	}
	
	
	
	//1차 카테고리 수정하기
	
	@ResponseBody
	@RequestMapping(value="/categoryUpdate", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> categroyOneUpdateDo(@RequestBody AdminCategoryVO vo){
		
		ResponseEntity<String> entity =null;
		try{
			logger.info("categroyOneUpdateDo :" +vo.toString());
			
			adminCategoryService.categoryOneUpdate(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	//1차 카테고리 삭제하기
	@ResponseBody
	@RequestMapping(value="/categoryDelete/{idx}", method=RequestMethod.DELETE)
	public ResponseEntity<String> categoryOneDeleteDo(@PathVariable("idx") Integer idx){
		ResponseEntity<String> entity =null;
		try{
			adminCategoryService.categoryOneDelete(idx);	
			entity=new ResponseEntity<String>("deleted", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			new ResponseEntity<String>("하위카테고리 목록을 먼저 삭제 해주세요." ,HttpStatus.BAD_REQUEST);
		}	
		return entity;
	}
	
	
	
	//2차 카테고리 등록
	@RequestMapping(value="/categorytwoInsert", method=RequestMethod.POST)
	public String categoryTwoInsertDo(AdminCategoryVO vo, RedirectAttributes rttr){
		
		logger.info("categoryTwoInsertDo :  " + vo.toString());
		
		adminCategoryService.categoryInsertTwo(vo);
		rttr.addFlashAttribute("message", "등록 되었습니다.");
		return "redirect:register.do";
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
	
	
	//2차 카테고리 업데이트
	@ResponseBody
	@RequestMapping(value="/categoryTwoUpdate", method=RequestMethod.PUT)
	public ResponseEntity<String> categoryTwoUpdate(@RequestBody AdminCategoryVO vo){
		
		ResponseEntity<String> entity=null;
		try{
			adminCategoryService.categoryTwoUpdate(vo);
			entity =new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//2차 카테고리 삭제
	@ResponseBody
	@RequestMapping(value="/categoryTwoDelete/{bno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> categoryTwoDelete(@PathVariable("bno") Integer bno){
		
		ResponseEntity<String> entity=null;
		try{
			adminCategoryService.categoryTwoDelete(bno);
			entity =new ResponseEntity<String>("deleted", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//3차 카테고리 등록
	
	@RequestMapping(value="/categoryThreeInsert", method=RequestMethod.POST)
	public String categoryThreeInsertDo(AdminCategoryVO vo, RedirectAttributes rttr){
		
		logger.info("categoryThreeInsertDo :  " + vo.toString());
		
		adminCategoryService.categoryInsertThree(vo);
		rttr.addFlashAttribute("message", "등록 되었습니다.");
		return "redirect:register.do";
		
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
	
	//3차 카테고리 수정하기
	@ResponseBody
	@RequestMapping(value="/categoryThreeUpdate", method=RequestMethod.PUT)
	public ResponseEntity<String> categoryThreeUpdate(@RequestBody AdminCategoryVO vo){
		
		ResponseEntity<String> entity=null;
		try{
			adminCategoryService.categoryThreeUpdate(vo);
			entity =new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	
	//3차 카테고리 삭제하기
	@ResponseBody
	@RequestMapping(value="/categoryThreeDelete/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> categoryThreeDelete(@PathVariable("rno") Integer rno){
		
		ResponseEntity<String> entity=null;
		try{
			adminCategoryService.categoryThreeDelete(rno);
			entity =new ResponseEntity<String>("deleted", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
}





