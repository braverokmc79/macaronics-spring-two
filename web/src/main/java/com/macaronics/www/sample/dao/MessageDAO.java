package com.macaronics.www.sample.dao;

import java.util.List;

import com.macaronics.www.sample.dto.MessageVO;
import com.macaronics.www.sample.dto.UserVO;

public interface MessageDAO {

	public void create(MessageVO vo) throws Exception;
	
	public MessageVO readMessage(Integer mid) throws Exception;
	
	public void updateState(Integer mid) throws Exception;
	
	
	public List<UserVO> userList() throws Exception;
	
	
	public List<MessageVO> messageList() throws Exception ;
	
}
