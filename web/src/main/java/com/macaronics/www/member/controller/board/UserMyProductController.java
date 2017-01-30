package com.macaronics.www.member.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.user.model.dto.CartVO;
import com.macaronics.www.user.model.dto.ProductOrderVO;
import com.macaronics.www.user.service.CartService;
import com.macaronics.www.user.service.ProductOrderService;

@Controller
@RequestMapping("/users/myproduct")
public class UserMyProductController {

	
	private static final Logger logger =LoggerFactory.getLogger(UserMyProductController.class);
	
	private static String JSP_PAGE ="/users/myproduct/";
	
	@Inject
	private CartService cartService;
	
	@Inject
	private ProductOrderService productOrderService;
	
	
	
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public ModelAndView list(HttpSession session, ModelAndView mav){
		
		Map<String, Object> map =new HashMap<>();
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		List<CartVO> cartList= cartService.listCart(member.getUserid());

		
		logger.info("cart Size : " +cartList.size());
		map.put("cartList", cartList);
		map.put("cartSize", cartList.size());
		mav.addObject("map", map);
		mav.setViewName(JSP_PAGE+"cart");
		
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
	
	
	
	
	@RequestMapping(value="/paymentList.do")
	public String prodcutOrderList(HttpSession session ,Model model){
		
		Map<String, Object> map =new HashMap<>();
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		
		List<ProductOrderVO> orderList= productOrderService.productOrder(member.getUserid());
		map.put("orderList", orderList);
		map.put("orderSize", orderList.size());

		model.addAttribute("map", map);
		
		return JSP_PAGE+"payment";		
	}
	
	
	
	
}
