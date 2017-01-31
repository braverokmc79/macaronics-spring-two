package com.macaronics.www.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.macaronics.www.admin.model.dao.AdminQnADAO;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;


@Service
public class AdminQnAServiceImpl implements AdminQnAService {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminQnAServiceImpl.class);
	
	@Inject
	private AdminQnADAO adminQnADAO;
	
	
	@Override
	public List<UsersQandAVO> questionList(PageAndSearch pas) {
		
		return adminQnADAO.questionList(pas);
	}

	@Override
	public List<UsersQandAVO> answerList(PageAndSearch pas) {
		
		return adminQnADAO.answerList(pas);
	}

	@Override
	public void reorderUpdate(int ref, int reorder) {
		adminQnADAO.reorderUpdate(ref, reorder);
		
	}

	
	@Transactional
	@Override
	public void replyInsert(UsersQandAVO vo) {
		
		//anwer update
		adminQnADAO.answerUpdate(vo.getRef());
		
		adminQnADAO.replyInsert(vo);
		
	}

	@Override
	public UsersQandAVO getQnA(Integer idx) {
		
		return adminQnADAO.getQnA(idx);
	}

	@Override
	public Integer listCount(String answer) {
		// TODO Auto-generated method stub
		return adminQnADAO.listCount(answer);
	}
	
	
}

