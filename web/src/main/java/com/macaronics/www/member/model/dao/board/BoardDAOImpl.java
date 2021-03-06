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
import com.macaronics.www.util.mysql.SearchCriteria;


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
	public void addAttach(String fullName) {
		
		sqlSession.insert(namespace +".addAttach", fullName);	
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

	
	//MYSQL 페이지 서치 리스트
	@Override
	public List<BoardVO> mysqlListSearchCriteria(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mysqlListSearchCriteria", cri);
	}

	@Override
	public int mysqlListSearchCount(SearchCriteria cri) {
	
		return sqlSession.selectOne(namespace+".mysqlListSearchCount", cri);
	}

	@Override
	public List<String> getAttach(Integer bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getAttach", bno);
	}

	@Override
	public void attachDelete(String fileName) {
		sqlSession.delete(namespace+".attachDelete", fileName);
	}

	
	
	//첨부파일 업데이트
	@Override
	public void updateAttach(String fileName, int bno) {
		// TODO Auto-generated method stub
		logger.info("%%%%%%%%%%%%%%% //첨부파일 업데이트  번호 Bno " +bno);
		logger.info("%%%%%%%%%%%%%%% //첨부파일 업데이트  fileName " +fileName);
		Map<String, Object> map =new HashMap<>();
		map.put("fileName", fileName);
		map.put("bno", bno);
		sqlSession.insert(namespace+".updateAttach", map);
	}



	
}



