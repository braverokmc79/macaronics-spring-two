package com.macaronics.www.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.user.model.dao.GalleryDao;
import com.macaronics.www.user.model.dto.GalleryDTO;



@Service
public class GalleryServiceImpl implements GalleryService{

	
	private static Logger logger =LoggerFactory.getLogger(GalleryServiceImpl.class);
	
	@Inject
	private GalleryDao  dao;
	
	
	@Override
	public List<GalleryDTO> galleryList() throws Exception {
		
		return dao.galleryList();
	}

	@Override
	public void insertGallery(GalleryDTO dto) throws Exception {
		dao.insertGallery(dto);
	}

	@Override
	public GalleryDTO readGallery(Integer idx) throws Exception {
		
		return dao.readGallery(idx);
	}

	@Override
	public void updateGallery(GalleryDTO dto) throws Exception {
		dao.updateGallery(dto);
	}

	@Override
	public void deleteGallery(Integer idx) throws Exception {
		dao.deleteGallery(idx);		
	}

	
	
}
