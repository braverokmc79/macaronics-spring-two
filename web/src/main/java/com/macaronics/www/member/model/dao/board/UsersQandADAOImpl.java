package com.macaronics.www.member.model.dao.board;

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
public class UsersQandADAOImpl implements UsersQandADAO {

	
	private static final Logger logger =LoggerFactory.getLogger(UsersQandADAOImpl.class);
	
	private static final String namespace= SqlServerEnvironment.SQL +".UserQnaMapper";
	
	@Inject
	private SqlSession sqlsession;
	
	
	@Override
	public void qnaInsert(UsersQandAVO vo) {
		sqlsession.insert(namespace+".qnaInsert", vo);
	}


	@Override
	public void qnaUpdate(UsersQandAVO vo) {
		sqlsession.update(namespace+".qnaUpdate");
	}

	@Override
	public UsersQandAVO getQnA(Integer idx, String userid) {
		Map<String, Object> map =new HashMap<>();
		map.put("idx", idx);
		map.put("userid", userid);
		return sqlsession.selectOne(namespace+".getQnA", map);
	}

	
	@Override
	public void qnaDelete(Integer idx) {
		
		sqlsession.delete(namespace+".qnaDelete", idx);
	}

	@Override
	public List<UsersQandAVO> qnaList(String userid, PageAndSearch pas) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("userid", userid);
		map.put("start", pas.getStart());
		map.put("end", pas.getEnd());		
		return sqlsession.selectList(namespace+".qnaList", map );
	}

	
	@Override
	public Integer listCount(String userid) {
		
		return sqlsession.selectOne(namespace+".listCount", userid);
	}

	
	
}
