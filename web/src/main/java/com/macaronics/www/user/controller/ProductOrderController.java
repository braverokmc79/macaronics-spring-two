package com.macaronics.www.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.user.model.dto.CartVO;
import com.macaronics.www.user.model.dto.ProductOrderVO;
import com.macaronics.www.user.service.CartService;
import com.macaronics.www.user.service.ProductOrderService;

@Controller
@RequestMapping("/shop/order")
public class ProductOrderController {

	private static final Logger logger=LoggerFactory.getLogger(CartController.class);
	
	private static final String JSP_PAGE = "/view/order/";
	
	
	@Inject
	private ProductOrderService productOrderService;
	
	@Inject
	private CartService cartService;
	
	
	
	@RequestMapping("/prodeuctInsertOrder.do")
	public String productInsertDo(HttpSession session, ProductOrderVO productOrderVo,
			RedirectAttributes rttr){
		
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		List<CartVO> cartList= cartService.listCart(member.getUserid());
		
		
		UUID uid =UUID.randomUUID();
		
		String idx =uid.toString() +"_"+member.getUserid();
		
		int count=0;

		try{	
			
			for(CartVO cartVO :cartList){
				
				//품절 상품 확인
				count =productOrderService.getAmoutProduct(cartVO.getProduct_id());
				if(count==0){
					rttr.addFlashAttribute("cartErrorMessage" , "품절된 상품이 존재 합니다.");
					return "redirect:/shop/cart/list.do";
				
				}	
				productOrderVo.setIdx(idx);
				productOrderVo.setAmount(cartVO.getAmount());
				productOrderVo.setMoney(cartVO.getMoney());
				productOrderVo.setPicture_url(cartVO.getPicture_url());
				productOrderVo.setPrice(cartVO.getPrice());
				productOrderVo.setProduct_id(cartVO.getProduct_id());
				productOrderVo.setProduct_name(cartVO.getProduct_name());
				productOrderVo.setProduct_state(cartVO.getProduct_state());
				productOrderVo.setUserid(cartVO.getUserid());
				productOrderVo.setUsername(cartVO.getUsername());
				productOrderService.productInsert(productOrderVo);
				
				//장바구니 비우기
				cartService.delete( cartVO.getProduct_id(), member.getUserid());
			}
			
		}catch(Exception e){
			e.printStackTrace();
			rttr.addFlashAttribute("cartErrorMessage" , "품절된 상품이 존재 합니다.");
		}

		return "redirect:orderList.do";
	}
	
	
	
	@RequestMapping(value="/orderList.do")
	public String prodcutOrderList(HttpSession session ,Model model){
		
		Map<String, Object> map =new HashMap<>();
		MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
		
		List<ProductOrderVO> orderList= productOrderService.productOrder(member.getUserid());
		map.put("orderList", orderList);
		map.put("orderSize", orderList.size());
	
		for(ProductOrderVO vo : orderList){
			logger.info(" ProductOrderVO : " + vo) ;
		}
	
		model.addAttribute("map", map);
		
		return JSP_PAGE+"order_list";		
	}
	
	
	
	
	
}



