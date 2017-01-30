package com.macaronics.www.member.model.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;



@Repository
public class UsersQandADAOImpl implements UsersQandADAO {

	
	private static final Logger logger =LoggerFactory.getLogger(UsersQandADAOImpl.class);
	
	private static final String namespace= SqlServerEnvironment.SQL +".QnaMapper";
	
	@Inject
	private SqlSession sqlsession;
	
	
	@Override
	public void qnaInsert(UsersQandAVO vo) {
		sqlsession.insert(namespace+".qnaInsert", vo);
	}

	@Override
	public List<UsersQandAVO> qnaList(String userid) {
		
		return sqlsession.selectList(namespace+".qnaList", userid );
	}

	@Override
	public void qnaUpdate(UsersQandAVO vo) {
		sqlsession.update(namespace+".qnaUpdate");
	}

	@Override
	public UsersQandAVO getQnA(Integer idx) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getQnA", idx);
	}

	
	@Override
	public void qnaDelete(Integer idx) {
		
		sqlsession.delete(namespace+".qnaDelete", idx);
	}

	
	
}
