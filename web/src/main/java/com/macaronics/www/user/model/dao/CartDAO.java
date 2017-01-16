package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.CartVO;

public interface CartDAO {
	public void insert(CartVO vo);
	public List<CartVO> listCart(String userid);
	void delete(int cart_id);
	void update(int cart_id);
	
}
