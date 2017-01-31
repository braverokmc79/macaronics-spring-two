package com.macaronics.www.user.model.dao;

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
public class QnADAOImpl implements QnADAO {

	private static final Logger logger =LoggerFactory.getLogger(QnADAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private final String namespace =SqlServerEnvironment.SQL+".QnaMapper";
	
	
	@Override
	public List<UsersQandAVO> list(PageAndSearch pas) {

		Map<String, Object> map =new HashMap<>();
		map.put("start", pas.getStart());
		map.put("end", pas.getEnd());
		
		return sqlSession.selectList(namespace+".list", map);
	}
	

	@Override
	public UsersQandAVO getRead(Integer idx) {

		return sqlSession.selectOne(namespace+".getRead", idx);
	}


	@Override
	public Integer count() {
		return sqlSession.selectOne(namespace+".count");
	}

	
	
	
}




