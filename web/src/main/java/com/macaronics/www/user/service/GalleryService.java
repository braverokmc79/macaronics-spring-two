package com.macaronics.www.user.service;

import java.util.List;

import com.macaronics.www.user.model.dto.GalleryDTO;

public interface GalleryService {

	
	public List<GalleryDTO> galleryList() throws Exception;
	
	public void insertGallery(GalleryDTO dto) throws Exception;
	
	public GalleryDTO readGallery(Integer idx) throws Exception;
	
	public void updateGallery(GalleryDTO dto) throws Exception;
	
	public void deleteGallery(Integer idx) throws Exception;
	
	
}
