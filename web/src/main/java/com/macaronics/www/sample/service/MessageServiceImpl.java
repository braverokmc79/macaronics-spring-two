package com.macaronics.www.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.macaronics.www.sample.dao.MessageDAO;
import com.macaronics.www.sample.dao.PointDAO;
import com.macaronics.www.sample.dto.MessageVO;
import com.macaronics.www.sample.dto.UserVO;

@Service
public class MessageServiceImpl implements MessageService{

	@Inject
	private MessageDAO messageDAO;
	
	@Inject
	private PointDAO pointDAO;
	
	
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		
		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(), 10);
	}
	
	

	@Override
	public MessageVO readMessage(String uid, Integer mno) throws Exception {
		
		messageDAO.updateState(mno);
		pointDAO.updatePoint(uid, 5);
		return messageDAO.readMessage(mno);
	}




	@Override
	public List<UserVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return messageDAO.userList();
	}



	@Override
	public List<MessageVO> messageList() throws Exception{
		// TODO Auto-generated method stub
		return messageDAO.messageList();
	}

	

	
	
	
	
	
}









