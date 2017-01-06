package com.macaronics.www.member.model.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;

@Repository
public class FreeBoadReplyDAOImpl implements FreeBoadReplyDAO{

	
	private static final Logger logger =LoggerFactory.getLogger(FreeBoadReplyDAOImpl.class);
	
	private static final String namespace= SqlServerEnvironment.SQL +"_freeBoardReplyMapper";
	
	@Inject
	private SqlSession sqlsession;
	
	
	
	@Override
	public List<FreeBoardReplyVO> list(Integer bno) {
		
		List<FreeBoardReplyVO> list=null;
		try {
			
			list=sqlsession.selectList(namespace +".list" , bno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	
	@Override
	public void create(FreeBoardReplyVO vo) {
		try {
			sqlsession.insert(namespace+".create", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void update(FreeBoardReplyVO vo) {
		try {
			sqlsession.update(namespace +".update", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void delete(Integer rno) {
		try {
			sqlsession.delete(namespace+".delete", rno);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
	
}
