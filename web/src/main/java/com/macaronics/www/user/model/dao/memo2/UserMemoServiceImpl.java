package com.macaronics.www.user.model.dao.memo2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.user.model.dao.memo.UserMemoDAO;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.xss.XssDefender;



@Service
public class UserMemoServiceImpl implements UserMemoService {

	
	@Inject
	private UserMemoDAO userMemoDAO;
	
	
	@Inject
	private UserMemo2DAO userMemo2DAO;
	
	private static final Logger logger =LoggerFactory.getLogger(UserMemoServiceImpl.class);
	
	
	@Override
	public List<UserMemoVO> list(String userid, PageAndSearch pas) {
		
		logger.info( " userid  :   " + userid);
		logger.info( " start : " + pas.getStart());
		logger.info( " end : " + pas.getEnd());
		
		Map<String , Object> map=new HashMap<>();
		map.put("start", pas.getStart());
		map.put("end", pas.getEnd());
		map.put("userid", userid);
		
		
		return userMemoDAO.list( map);
	}

	@Override
	public UserMemoVO getMemo(Integer idx) {
		// TODO Auto-generated method stub
		return userMemoDAO.getMemo(idx);
	}

	@Override
	public void insertMemo(UserMemoVO vo) throws Exception {
		//태그 제거
			
			if(vo.getFriendName()!=null){	
				String friendName=XssDefender.removeTag(vo.getFriendName());
				vo.setFriendName(friendName);
			}
			if(vo.getEmail()!=null){
				String email=XssDefender.removeTag(vo.getEmail());
				vo.setEmail(email);
			}
			if(vo.getPhone()!=null){
				String phone=XssDefender.removeTag(vo.getPhone());
				vo.setPhone(phone);
			}
		
			userMemoDAO.insertMemo(vo);
			
		
	}

	@Override
	public void memoUpdate(UserMemoVO vo) throws Exception {
		
	
			
			if(vo.getFriendName()!=null){	
				String friendName=XssDefender.removeTag(vo.getFriendName());
				vo.setFriendName(friendName);
			}
			if(vo.getEmail()!=null){
				String email=XssDefender.removeTag(vo.getEmail());
				vo.setEmail(email);
			}
			if(vo.getPhone()!=null){
				String phone=XssDefender.removeTag(vo.getPhone());
				vo.setPhone(phone);
			}
		
			userMemoDAO.memoUpdate(vo);
		
		
	}

	@Override
	public void memoDelete(Integer idx) {
		userMemoDAO.memoDelete(idx);
		
	}

	@Override
	public int countMemo(String userid) {
		
		return userMemoDAO.countMemo(userid);
	}

}
