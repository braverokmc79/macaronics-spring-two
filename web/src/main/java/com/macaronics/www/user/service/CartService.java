package com.macaronics.www.user.service;

import java.util.List;

import com.macaronics.www.user.model.dto.CartVO;

public interface CartService {

	public void insert(CartVO vo);
	public List<CartVO> listCart(String userid);
	void delete(int product_id);
	void update(int cart_id);
	
	//남은 상품 총 수량 가져오기
	public int prodcutAmount(Integer product_id);
}
