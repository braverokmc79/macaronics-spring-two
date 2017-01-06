package com.macaronics.www.member.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.member.model.dao.board.FreeBoadReplyDAO;
import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;


@Service
public class FreeBoadReplyServiceImpl implements FreeBoadReplyService {

	
	private static final Logger logger=LoggerFactory.getLogger(FreeBoadReplyServiceImpl.class);
	
	@Inject
	private FreeBoadReplyDAO  freeBoardReplyao;
	
	@Override
	public List<FreeBoardReplyVO> list(Integer bno) {
		// TODO Auto-generated method stub
		return freeBoardReplyao.list(bno);
	}

	@Override
	public void create(FreeBoardReplyVO vo) {
		// TODO Auto-generated method stub
		
		freeBoardReplyao.create(vo);
	}

	@Override
	public void update(FreeBoardReplyVO vo) {
		// TODO Auto-generated method stub

		freeBoardReplyao.update(vo);
	}

	@Override
	public void delete(Integer rno) {
		// TODO Auto-generated method stub
		freeBoardReplyao.delete(rno);
	}

}
