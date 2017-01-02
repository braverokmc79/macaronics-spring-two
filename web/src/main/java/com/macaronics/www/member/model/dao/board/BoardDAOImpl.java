package com.macaronics.www.member.model.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.member.model.dto.board.BoardVO;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger =LoggerFactory.getLogger(BoardDAOImpl.class);
	
	
	// private static final String namespace="oracleBoardMapper";
	
	private static final String namespace="mysqlBoardMapper";
	
	
	
	@Override
	public List<BoardVO> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".boardList");
	}

	@Override
	public void boardCreate(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".boardCreate", vo);
	}

	@Override
	public BoardVO boardRead(Integer bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".boardRead", bno);
	}

	@Override
	public void boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".boardUpdate", vo);
	}

	@Override
	public void boardDelete(Integer bno) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".boardDelete", bno);
	}

}



