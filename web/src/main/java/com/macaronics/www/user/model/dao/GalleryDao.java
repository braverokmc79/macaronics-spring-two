package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.GalleryDTO;

public interface GalleryDao {

	
	public List<GalleryDTO> galleryList() throws Exception;
	
	public void insertGallery(GalleryDTO dto) throws Exception;
	
	public GalleryDTO readGallery(Integer idx) throws Exception;
	
	public void updateGallery(GalleryDTO dto) throws Exception;
	
	public void deleteGallery(Integer idx) throws Exception;
	
	
}
