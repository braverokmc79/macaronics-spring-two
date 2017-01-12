package com.macaronics.www.user.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.user.model.dto.GalleryDTO;


@Repository
public class GalleryDaoImpl implements GalleryDao {

	
	private static Logger logger =LoggerFactory.getLogger(GalleryDaoImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace=SqlServerEnvironment.SQL+"galleryMapper";
	
	
	
	@Override
	public List<GalleryDTO> galleryList() throws Exception {
	
		return sqlSession.selectList(namespace+".galleryList");
	}

	@Override
	public void insertGallery(GalleryDTO dto) throws Exception {
	
		sqlSession.insert(namespace+".insertGallery", dto);
	}

	@Override
	public GalleryDTO readGallery(Integer idx) throws Exception {
	
		return sqlSession.selectOne(namespace+".readGallery" , idx);
	}

	@Override
	public void updateGallery(GalleryDTO dto) throws Exception {
		sqlSession.update(namespace+".updateGallery", dto);
	}

	
	
	@Override
	public void deleteGallery(Integer idx) throws Exception {
		sqlSession.delete(namespace+".deleteGallery" , idx);
	}

	
	
}
