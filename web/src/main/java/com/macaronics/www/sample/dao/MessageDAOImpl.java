package com.macaronics.www.sample.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.macaronics.www.sample.dto.MessageVO;
import com.macaronics.www.sample.dto.UserVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace ="ORACLEmessageMapper";
	
	//메시지 보내기
	@Override
	public void create(MessageVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	//메시지 읽은 아이디
	@Override
	public MessageVO readMessage(Integer mid) throws Exception {
	
		return session.selectOne(namespace + ".readMessage", mid);
	}

	
	
	@Override
	public void updateState(Integer mid) throws Exception {	
		session.update(namespace + ".updateState", mid);
	}

	
	
	
	@Override
	public List<UserVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".userList");
	}

	@Override
	public List<MessageVO> messageList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".messageList");
	}

	
	
	
	
	
}






