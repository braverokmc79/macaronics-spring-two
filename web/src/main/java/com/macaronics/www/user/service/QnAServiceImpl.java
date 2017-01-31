package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.user.model.dao.QnADAO;
import com.macaronics.www.util.oralce.PageAndSearch;


@Service
public class QnAServiceImpl implements QnAService {

	private static final Logger logger =LoggerFactory.getLogger(QnAServiceImpl.class);
	
	@Inject
	private QnADAO qnADAO;
	
	
	@Override
	public List<UsersQandAVO> list(PageAndSearch pas) {
		List<UsersQandAVO> list=null;
		try {
			
			list =qnADAO.list(pas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	@Override
	public UsersQandAVO getRead(Integer idx) {	
		return qnADAO.getRead(idx);
	}
	

	@Override
	public Integer count() {
		// TODO Auto-generated method stub
		return qnADAO.count();
	}

	
	
}


