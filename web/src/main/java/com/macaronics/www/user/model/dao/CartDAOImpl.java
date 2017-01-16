package com.macaronics.www.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.CartVO;


@Repository
public class CartDAOImpl implements CartDAO {

	private static final Logger logger=LoggerFactory.getLogger(CartDAOImpl.class);
	
	@Inject
	private SqlSession session;
	
	private final static String namespace=SqlServerEnvironment.SQL+"cartMapper";
	
	
	@Override
	public void insert(CartVO vo) {
		
		session.insert(namespace+".insert" ,vo);
	}

	@Override
	public List<CartVO> listCart(String userid) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listCart" , userid);
	}

	@Override
	public void delete(int product_id, String userid) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("product_id", product_id);
		map.put("userid", userid);
		session.delete(namespace+".delete", map);
	}

	@Override
	public void update(Integer product_id, String userid, Integer amount) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("product_id", product_id);
		map.put("userid", userid);
		map.put("amount", amount);
		
		session.update(namespace+".update", map);
	}

	@Override
	public void upadeteProudAmout(Integer amount, Integer product_id) {
		Map<String ,Object> map =new HashMap<>();
		map.put("amount",  amount);
		map.put("product_id", product_id);
		
		session.update(namespace+".upadeteProudAmout", map);	
	}

	@Override
	public int prodcutAmount(Integer product_id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".prodcutAmount", product_id);
	}
	
	
	

}
