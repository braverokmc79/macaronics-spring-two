package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.user.model.dao.CartDAO;
import com.macaronics.www.user.model.dto.CartVO;import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Service
public class CartServiceImpl implements CartService {

	
	private static final Logger logger=LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Inject
	private CartDAO dao;
	
	@Transactional
	@Override
	public void insert(CartVO vo) {
		try {
			
			dao.insert(vo);
			//상품 총 수량 빼기
			dao.upadeteProudAmout(vo.getAmount(), vo.getProduct_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CartVO> listCart(String userid) {
		List<CartVO> list =null;
		try {
				list=dao.listCart(userid);
				//남은 상품 총 수량 가져오기
				
				//전체 합계 계산
				int sum=0;
				int sum_deliver=0;
				for(CartVO vo :list){
					sum +=vo.getMoney();
					//3만원 작으면 이상시 배송비 추가
					if(vo.getMoney() < vo.getDeliver()){
						sum =sum+vo.getDeliver_money();
					}else{
						//물품 구매액이 3만원보다 크면
						//배송비 0원
						vo.setDeliver_money(0);
						
					}
					
					//배송비 전체 합계
					sum_deliver +=vo.getDeliver_money();
					vo.setTotal_deliver_money(sum_deliver);
					
					//전체가격
					vo.setTotal_sum(sum);		

					//상품 남은 총 수량
					vo.setProduct_amount(dao.prodcutAmount(vo.getProduct_id()));
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public void delete(int product_id, String userid) {
		try {
			dao.delete(product_id, userid);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Integer product_id, String userid, Integer amount) {
		try{
			dao.update(product_id, userid, amount);	
		}catch(Exception e){
			e.printStackTrace();
		}	
	}

	@Override
	public int prodcutAmount(Integer product_id) {
		// TODO Auto-generated method stub
		return dao.prodcutAmount(product_id);
	}


}
