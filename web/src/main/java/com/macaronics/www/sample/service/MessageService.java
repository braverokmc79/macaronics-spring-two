package com.macaronics.www.sample.service;

import java.util.List;

import com.macaronics.www.sample.dto.MessageVO;
import com.macaronics.www.sample.dto.UserVO;

public interface MessageService {

	public void addMessage(MessageVO vo) throws Exception;
	
	public MessageVO readMessage(String uid, Integer mno) throws Exception;
	
	
	public List<UserVO> userList() throws Exception;
	
	
	public List<MessageVO> messageList() throws Exception ;
	
	
	
}
