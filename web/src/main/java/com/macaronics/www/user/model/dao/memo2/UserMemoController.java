package com.macaronics.www.user.model.dao.memo2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping(value="/users/memo")
public class UserMemoController {

	
	private final static Logger logger=LoggerFactory.getLogger(UserMemoController.class);
	
	@Inject
	private UserMemoService userMemoService;
	
	
	private final String JSP_PAGE ="/users/memo/";
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String memoList(HttpSession session, Model model, PageAndSearch pas){
		logger.info("list.do  : " );
		
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		String userid=member.getUserid();
		logger.info("count 전 **   : " + userid);
		int count =userMemoService.countMemo(userid);
		logger.info("count 후 **   : "  + count);
		
		
		//페이지 나누기 관련 처리
		if(pas.getCurPage()==null){pas.setCurPage(1);}
		
		Pager.PAGE_SCALE=30;
		Pager pager =new Pager(count, pas.getCurPage());
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		pas.setStart(start);
		pas.setEnd(end);
		
		logger.info("list.do list 전 ** userid   : "  + userid + " start :" +pas.getStart() + " end : " + pas.getEnd());
		List<UserMemoVO> list=userMemoService.list(userid, pas);
		
		logger.info("list.do list 후 **   : " );
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("pager", pager);
		
		
		model.addAttribute("map",map);
		model.addAttribute("pageAndSearch",pas);
		model.addAttribute("memolist", list);
		
		return JSP_PAGE+"memolist";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/getmemo/{idx}", method=RequestMethod.GET)
	public ResponseEntity<UserMemoVO> getMemo( @PathVariable("idx") Integer idx){
		
		ResponseEntity<UserMemoVO> entity =null;
		
		try{
			UserMemoVO vo=userMemoService.getMemo(idx);
			
			entity =new ResponseEntity<UserMemoVO>(vo, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();	
			entity=new ResponseEntity<UserMemoVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	//한줄 메모 등록하기 폼
	
	@RequestMapping(value="/memoWriteForm", method=RequestMethod.GET)
	public String memoReisterForm(){
		
		return JSP_PAGE +"memoWrite";
	}
	
	
	//등록하기
	@RequestMapping(value="/memoWrite", method=RequestMethod.POST)
	public String memoWrite(HttpSession session, UserMemoVO vo, RedirectAttributes rttr){
		
		try{
			
	
			
			MemberDTO loginUser =(MemberDTO)session.getAttribute("loginUser");
			String userid=loginUser.getUserid();
			vo.setUserid(userid);
			
					
			userMemoService.insertMemo(vo);
			
		}catch(Exception e){
			e.printStackTrace();
			
			rttr.addFlashAttribute("errorMessage", "1000글자 이하로 적어 주세요.");
			rttr.addAttribute("vo", vo);
			return "redirect:memoWriteForm";
		}
		
		return "redirect:list.do";
	}
	
	
	
	//메모 수정 폼
	@RequestMapping(value="/alterform/{idx}", method=RequestMethod.GET)
	public String alterform(@PathVariable("idx") Integer idx, Model model){
		
		UserMemoVO vo=userMemoService.getMemo(idx);
		
		model.addAttribute("vo", vo);
		
		return JSP_PAGE+"memoAlter";
	}
	
	
	// 메모 업데이트
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String memoUpdate(HttpSession session, UserMemoVO vo, RedirectAttributes rttr){
		try{
			

			userMemoService.memoUpdate(vo);
			return "redirect:list.do";
			
		}catch(Exception e){
			e.printStackTrace();
			rttr.addFlashAttribute("errorMessage", "1000글자 이하로 적어 주세요.");
			rttr.addAttribute("vo", vo);
			return "redirect:alterform/"+vo.getIdx();
		}
			
		
	}
	
	
	//메모 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String memoDelete(@RequestParam Integer idx){
		
		userMemoService.memoDelete(idx);
		
		return "redirect:list.do";
	}
	
	
	
}




