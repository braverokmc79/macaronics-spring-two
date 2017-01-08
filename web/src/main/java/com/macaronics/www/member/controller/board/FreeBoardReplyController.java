package com.macaronics.www.member.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;
import com.macaronics.www.member.service.board.FreeBoadReplyService;
import com.macaronics.www.util.oralce.Pager;

@RestController
@RequestMapping(value="/freeboard_reply/*")
public class FreeBoardReplyController {
	
	@Inject
	private FreeBoadReplyService service;
	
	private static final Logger logger =LoggerFactory.getLogger(FreeBoardReplyController.class);
	
	@ResponseBody
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
	

	@ResponseBody
	@RequestMapping(value="/listAll/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> ready(@PathVariable("bno") Integer bno,
			@PathVariable("page")  Integer page ){		
		ResponseEntity<Map<String, Object>> entity =null;

		
		if(SqlServerEnvironment.SQL.equals("ORACLE")){
			entity=oracleListAlll(bno, page);
		}else{
			//entity=mysqlListAlll(bno, page);
		}		
		return entity;
	}
	
	
	
	//오라클 댓글 리스트
	public ResponseEntity<Map<String, Object>> oracleListAlll (Integer bno, Integer page){
		
		ResponseEntity<Map<String, Object>> entity =null;
		
		try{		
			int count =service.countOracleReply(bno);
			//페이지 나누기 관련 처리
		
			Pager pager =new Pager(count, page);
			
			int start =pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<FreeBoardReplyVO> list =service.oracleList(bno, start, end);
			
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			map.put("pager", pager);
			
			entity=new ResponseEntity<Map<String, Object>>(map , HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<Map<String, Object>>(HttpStatus.OK);
		}
		return entity;
	}

	
	
	// mysql 댓글 리스트
	public ResponseEntity<List<FreeBoardReplyVO>> mysqlListAlll (Integer bno){
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






