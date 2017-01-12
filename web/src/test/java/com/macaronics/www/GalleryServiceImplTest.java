/**
 * 
 */
package com.macaronics.www;

import static org.junit.Assert.fail;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.macaronics.www.user.model.dto.GalleryDTO;
import com.macaronics.www.user.service.GalleryService;

/**
 * @author choi
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class GalleryServiceImplTest {

	/**
	 * Test method for {@link com.macaronics.www.user.service.GalleryServiceImpl#galleryList()}.
	 */
	@Inject
	GalleryService service;
	
	private static final Logger logger=LoggerFactory.getLogger(GalleryServiceImplTest.class);
	


	/**
	 * Test method for {@link com.macaronics.www.user.service.GalleryServiceImpl#insertGallery(com.macaronics.www.user.model.dto.GalleryDTO)}.
	 */
	@Test
	public void testInsertGallery() throws Exception {
		
		GalleryDTO dto=new GalleryDTO();
		
		service.insertGallery(dto);
		
	}

	@Test
	public void testGalleryList() throws Exception{
		
		
		List<GalleryDTO> list=
		service.galleryList();
		for(GalleryDTO dto : list){
			
			logger.info(dto.toString());
		}
		
		
	}
	
	
	/**
	 * Test method for {@link com.macaronics.www.user.service.GalleryServiceImpl#readGallery(java.lang.Integer)}.
	 */
	@Test
	public void testReadGallery() throws Exception {
		
		logger.info(service.readGallery(1).toString());
	}

	/**
	 * Test method for {@link com.macaronics.www.user.service.GalleryServiceImpl#updateGallery(com.macaronics.www.user.model.dto.GalleryDTO)}.
	 */
	@Test
	public void testUpdateGallery() throws Exception {
		GalleryDTO dto=new GalleryDTO();
		dto.setFileName("update");
	
		service.updateGallery(dto);
	}

	/**
	 * Test method for {@link com.macaronics.www.user.service.GalleryServiceImpl#deleteGallery(java.lang.Integer)}.
	 */
	@Test
	public void testDeleteGallery() throws Exception {
		//service.deleteGallery(2);
	}

}
