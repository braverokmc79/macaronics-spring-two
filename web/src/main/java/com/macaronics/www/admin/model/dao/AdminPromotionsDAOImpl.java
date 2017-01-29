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
import com.macaronics.www.admin.model.dto.AdminPromotionsVO;
import com.macaronics.www.util.oralce.PageAndSearch;


@Repository
public class AdminPromotionsDAOImpl implements AdminPromotionsDAO {

	private static final Logger logger= LoggerFactory.getLogger(AdminPromotionsDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=SqlServerEnvironment.SQL+".AdminPromotionsMapper";

	
	
	@Override
	public List<AdminPromotionsVO> getPromotionsList(int start, int end, PageAndSearch pas) throws Exception {
		Map<String, Object> map =new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", pas.getSearch_option());
		map.put("keyword", pas.getKeyword());
		return sqlSession.selectList(namespace+".getPromotionsList",map);
	}

	@Override
	public void promotionsInsert(AdminPromotionsVO vo) throws Exception {
		
		sqlSession.insert(namespace+".promotionsInsert", vo);
	}

	@Override
	public void promotionsUpdate(AdminPromotionsVO vo) throws Exception {
		
		sqlSession.update(namespace+".promotionsUpdate", vo);
	}

	@Override
	public void promotionsDelete(Integer idx) throws Exception {
		sqlSession.delete(namespace+".promotionsDelete", idx);
	}
	

	@Override
	public AdminPromotionsVO promotionsUpdateForm(Integer idx) throws Exception {
		
		return sqlSession.selectOne(namespace+".promotionsUpdateForm", idx);
	}
	
	

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String, Object> map =new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne(namespace+".countArticle", map);
	}
	
	
	


}
