package com.macaronics.www.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.user.model.dto.CartVO;
import com.macaronics.www.user.service.CartService;

@Controller
@RequestMapping("/shop/cart")
public class CartController {

	private static final Logger logger=LoggerFactory.getLogger(CartController.class);
	
	
	private static final String JSP_PAGE = "/view/cart/";
	
	
	@Inject
	private CartService cartService;
	
	
	@ResponseBody
	@RequestMapping(value="/insert.do" , method=RequestMethod.POST)
	public ResponseEntity<String> productInsertDo(@RequestBody CartVO vo, HttpSession session){
	
		logger.info(" product_id : " + vo.getProduct_id() + "  amount : " +vo.getAmount());
		ResponseEntity<String> entity =null;
		try{
			MemberDTO dto=(MemberDTO)session.getAttribute("loginUser");
			vo.setUserid(dto.getUserid());
			cartService.insert(vo);
			entity =new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav){
		
		Map<String, Object> map =new HashMap<>();
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		List<CartVO> cartList= cartService.listCart(member.getUserid());
		for(CartVO vo :cartList){
			logger.info(" 0000  : " +vo.toString());
		}
		logger.info("cart Size : " +cartList.size());
		map.put("cartList", cartList);
		map.put("cartSize", cartList.size());
		mav.addObject("map", map);
		mav.setViewName(JSP_PAGE+"cart_list");
		
		//그룹 바이로 기존에 있는 상품 업데이트 중복 제거 된상태
		//수정 처리를 쉽게 하기위해
		//기존 제품 삭제
		if(cartList.size() > 0){
			for(CartVO vo :cartList){
				cartService.delete(vo.getProduct_id(), vo.getUserid());
			}
			//다시 상품 첨가
			for(CartVO vo :cartList){
				
				cartService.insert(vo);
			}	
		}

		
		return mav;
	}
	
	
	//장바구니  삭제
	
	@RequestMapping(value="/cartDelete.do")
	public String cartDelete(@RequestParam Integer product_id, 
				@RequestParam String userid){
		
		cartService.delete(product_id, userid);
		return "redirect:list.do";
	}
	
	
	//장바구니 업데이트
	@RequestMapping(value="/cartUpdate.do" )
	public String cartUpdate(@RequestParam Integer product_id, 
			@RequestParam String userid, @RequestParam Integer amount
			){
		
		cartService.update(product_id, userid, amount);
		return "redirect:list.do";
	}
	
	
	
	//Test
	/*@RequestMapping("/update.do")
	public String udateSampleDo(int[] amount, int[] product_id,
			HttpSession session){
		
		MemberDTO dto =(MemberDTO)session.getAttribute("loginUser");
		String userid =dto.getUserid();
		for(int i=0; i<product_id.length ; i++){
			CartVO vo =new CartVO();
			vo.setUserid(userid);
			vo.setProduct_id(product_id[i]);
			vo.setAmount(amount[i]);
			cartService.update(vo.getProduct_id(), userid, vo.getAmount());
		}
		
		return "redirect:/shop/cart/list.do";
	}*/
	
	
	
	/*쿼리
	 Mapper.xml
	 update cart set amount=amount+#{amount}
	  where userid=#{userid} and product_id=#{product_id}
	 
	 */
	// 배열로 값을 받아 처리 하려고 했으나 안된다.
	//변경
	
	
/*	@RequestMapping("/update.do")
	public String udateSampleDo(HttpServletRequest request,
			HttpSession session){
		
		MemberDTO dto =(MemberDTO)session.getAttribute("loginUser");
		String userid =dto.getUserid();
		//레코드 개수
		int count =Integer.parseInt(request.getParameter("count"));
		for(int i=0; i<count ; i++){
			int amount =
			 Integer.parseInt(request.getParameter("amount["+i+"]"));
			int product_id=
				Integer.parseInt(request.getParameter("product_id["+i+"]"));
			CartVO vo =new CartVO();
			vo.setUserid(userid);
			vo.setProduct_id(product_id);
			vo.setAmount(amount);
			cartService.update(vo.getProduct_id(), userid, vo.getAmount());
		}
		return "redirect:/shop/cart/list.do";
	}
	*/
	/*쿼리
	 Mapper.xml
	 update cart set amount=amount+#{amount}
	  where userid=#{userid} and product_id=#{product_id}
	 
	 */
	
	
	
}



