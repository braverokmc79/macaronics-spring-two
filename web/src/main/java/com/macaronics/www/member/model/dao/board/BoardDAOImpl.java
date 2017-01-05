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
import com.macaronics.www.member.model.dto.board.BoardVO;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger =LoggerFactory.getLogger(BoardDAOImpl.class);
	
	
   private static final String namespace=SqlServerEnvironment.SQL+"BoardMapper";
	

	
	
	
	@Override
	public List<BoardVO> boardList(int start, int end, String search_option, String keyword) {
		
		Map<String, Object> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(namespace+".boardList", map);
	}

	@Override
	public void boardCreate(BoardVO vo) {
		// TODO Auto-generated method stub
		logger.info(" 데이터 삽입 : " + vo.toString());
		try{
			sqlSession.insert(namespace+".boardCreate", vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
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

	
	
	//조회수 증가
	@Override
	public void viewCntUpdate(Integer bno) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".viewCntUpdate", bno);
	}

	@Override
	public BoardVO getBoard(Integer bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getBoard", bno);
	}

	
	//레코드 개수 계산
	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, Object> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace+".countArticle", map);
	}

	
}



