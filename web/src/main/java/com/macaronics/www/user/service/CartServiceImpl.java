package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.user.model.dao.CartDAO;
import com.macaronics.www.user.model.dto.CartVO;import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Service
public class CartServiceImpl implements CartService {

	
	private static final Logger logger=LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Inject
	private CartDAO dao;
	
	@Override
	public void insert(CartVO vo) {
		try {
			dao.insert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CartVO> listCart(String userid) {
		List<CartVO> list =null;
		try {
			list=dao.listCart(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public void delete(int cart_id) {
		try {
			dao.delete(cart_id);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(int cart_id) {
		try{
			dao.update(cart_id);	
		}catch(Exception e){
			e.printStackTrace();
		}	
	}

}
