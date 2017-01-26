package com.macaronics.www.user.model.dao.memo2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dao.CouponDAOImpl;
import com.macaronics.www.user.model.dao.memo.UserMemoDAO;

@Repository
public class UserMemoDAOImpl implements UserMemo2DAO {

	
	private final String namespace=SqlServerEnvironment.SQL+".userMemoMapper";
	
	private final static Logger logger  =LoggerFactory.getLogger(UserMemoDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession; 
	
	
	@Override
	public List<UserMemoVO> list(Integer start, Integer end, String userid) {
		
		Map<String , Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("userid", userid);
		
		
		return sqlSession.selectList(namespace+".list", map);
	}


	@Override
	public List<UserMemoVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

}
