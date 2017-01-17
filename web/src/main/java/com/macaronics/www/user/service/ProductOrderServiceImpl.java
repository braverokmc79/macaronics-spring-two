package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.user.model.dao.CartDAO;
import com.macaronics.www.user.model.dao.ProductOrderDAO;
import com.macaronics.www.user.model.dto.CartVO;
import com.macaronics.www.user.model.dto.ProductOrderVO;


@Service
public class ProductOrderServiceImpl implements ProductOrderService {

	@Inject
	private ProductOrderDAO  dao;
	
	@Inject
	private CartDAO cartDao;
	
	private static final Logger logger=LoggerFactory.getLogger(ProductOrderServiceImpl.class);
	
	
	
	@Override
	public List<ProductOrderVO> productOrder(String userid) {
		
		List<ProductOrderVO> list =null;
		try{
			
			list =dao.productOrder(userid);
			//남은 상품 총 수량 가져오기
			

			for(ProductOrderVO vo :list){
	
				//3만원 작으면 이상시 배송비 추가
				if(vo.getMoney() < vo.getDeliver()){
					
				}else{
					//물품 구매액이 3만원보다 크면
					//배송비 0원
					vo.setDeliver_money(0);			
				}
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return list;
	}

	@Transactional
	@Override
	public void productInsert(ProductOrderVO vo) {
		try{
			//상품 전체 수량 확인
			int count=dao.getAmoutProduct(vo.getProduct_id());
			
			if(count==0){
				
				//품절 된 상품 존재 반환
				return ;
			}
			
			dao.productInsert(vo);
			
			//상품 총 수량 빼기
			cartDao.upadeteProudAmout(vo.getAmount(), vo.getProduct_id());
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
	
	//품절 상태 확인
	public int getAmoutProduct(Integer product_id){		
		return dao.getAmoutProduct(product_id);
	}
	
	
	
	
}
