package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.CartVO;

public interface CartDAO {
	public void insert(CartVO vo);
	public List<CartVO> listCart(String userid);
	void delete(int product_id, String userid);
	void update(Integer product_id, String userid, Integer amount);
	
	//장바구니에 상품 추가시 상품 총 수량 빼기
	
	public void upadeteProudAmout(Integer amount , Integer product_id);

	//남은 상품 총 수량 가져오기
	public int prodcutAmount(Integer product_id);

	
	
}
