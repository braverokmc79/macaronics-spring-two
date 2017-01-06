package com.macaronics.www.member.controller.board;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
	
	
	
}


