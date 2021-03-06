package com.macaronics.www.member.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.member.model.dao.board.UsersQandADAO;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.xss.XssDefender;

@Service
public class UsersQandServiceImpl implements UsersQandService {

	@Inject
	private UsersQandADAO usersQandADAO;
	
	
	private static final Logger logger =LoggerFactory.getLogger(UsersQandServiceImpl.class);
	
	
	@Override
	public void qnaInsert(UsersQandAVO vo) {
		
		try{
			
			String subject=XssDefender.inputString(vo.getSubject());
			String content =XssDefender.inputString(vo.getContent());
			vo.setSubject(subject);
			vo.setContent(content);
			
			usersQandADAO.qnaInsert(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}


	@Override
	public void qnaUpdate(UsersQandAVO vo) {
		try{		
			usersQandADAO.qnaUpdate(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public UsersQandAVO getQnA(Integer idx, String userid) {
		UsersQandAVO vo =null;
		try{
			vo =usersQandADAO.getQnA(idx, userid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void qnaDelete(Integer idx) {
		
		try{
			usersQandADAO.qnaDelete(idx);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	@Override
	public List<UsersQandAVO> qnaList(String userid, PageAndSearch pas) {

		List<UsersQandAVO> list=null;
		try{
			
			list=usersQandADAO.qnaList(userid, pas);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return  list;
	}

	@Override
	public Integer listCount(String userid) {
		
		return usersQandADAO.listCount(userid);
	}
	
	

}
