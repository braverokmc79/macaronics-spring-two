package com.macaronics.www.member.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;
import com.macaronics.www.member.service.board.FreeBoadReplyService;

@RestController
@RequestMapping(value="/freeboard_reply/*")
public class FreeBoardReplyController {
	
	@Inject
	private FreeBoadReplyService service;
	
	private static final Logger logger =LoggerFactory.getLogger(FreeBoardReplyController.class);
	
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody FreeBoardReplyVO vo){
		ResponseEntity<String> entity=null;
		try{
			entity =new ResponseEntity<String>("SUCCESS" ,HttpStatus.OK);
			service.create(vo);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public ModelAndView ready(@RequestParam("bno") Integer bno, ModelAndView mav){
		
		List<FreeBoardReplyVO> list =service.list(bno);	
		for(FreeBoardReplyVO row:  list){
			logger.info(" row  :" + row.toString());
		}
	
		mav.addObject("list", list);
		mav.setViewName("/view/board/reply_list");
		return mav; 
	}
	

	
	@RequestMapping(value="/listAll/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<FreeBoardReplyVO>> ready(@PathVariable("bno") Integer bno){		
		ResponseEntity<List<FreeBoardReplyVO>> entity =null;
		try{
			List<FreeBoardReplyVO> list =service.list(bno);
			
			entity=new ResponseEntity<List<FreeBoardReplyVO>>(list , HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<List<FreeBoardReplyVO>>(HttpStatus.OK);
		}
		return entity;
	}
	
	
	
	
	
	
}






