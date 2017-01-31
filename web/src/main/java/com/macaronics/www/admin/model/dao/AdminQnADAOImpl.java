package com.macaronics.www.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.board.UsersQandAVO;
import com.macaronics.www.util.oralce.PageAndSearch;

@Repository
public class AdminQnADAOImpl implements AdminQnADAO {

	private static Logger logger =LoggerFactory.getLogger(AdminQnADAOImpl.class);
	
	@Inject	
	private SqlSession sqlSession;
	

	private final String namespace =SqlServerEnvironment.SQL +".adminQnAMapper";
	
	
	@Override
	public List<UsersQandAVO> questionList(PageAndSearch pas) {
		Map<String, Object> map =new HashMap<>();
		map.put("start", pas.getStart());
		map.put("end", pas.getEnd());
		return sqlSession.selectList(namespace+".questionList", map);
	}

	@Override
	public List<UsersQandAVO> answerList(PageAndSearch pas) {
		Map<String, Object> map =new HashMap<>();
		map.put("start", pas.getStart());
		map.put("end", pas.getEnd());
		return sqlSession.selectList(namespace+".answerList", map);
	}

	
	@Override
	public void replyInsert(UsersQandAVO vo) {
		
		sqlSession.insert(namespace+".replyInsert", vo);
	}

	
	@Override
	public void reorderUpdate(int ref, int reorder) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("ref", ref);
		map.put("reorder", reorder);
		sqlSession.update(namespace+".reorderUpdate", map);
	}

	@Override
	public void answerUpdate(int ref) {
		sqlSession.update(namespace+".answerUpdate", ref);
		
	}

	@Override
	public UsersQandAVO getQnA(Integer idx) {
		
		return sqlSession.selectOne(namespace+".getQnA", idx);
	}

	
	@Override
	public Integer listCount(String answer) {
		
		return sqlSession.selectOne(namespace+".listCount", answer);
	}
	
	

}
