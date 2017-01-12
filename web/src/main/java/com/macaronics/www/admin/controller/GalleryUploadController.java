package com.macaronics.www.admin.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.macaronics.www.user.model.dto.GalleryDTO;
import com.macaronics.www.user.service.GalleryService;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.upload.MediaUtils;
import com.macaronics.www.util.upload.UploadFileUtils;

@Controller
@RequestMapping("/gallery")
public class GalleryUploadController {

	
	private static final String JSP_PAGE ="/admin/gallery/";
	
	private static Logger logger =LoggerFactory.getLogger(GalleryUploadController.class);
	
	@Inject
	private GalleryService service;
	
	
	@RequestMapping(value ="/uploadAjax",  method=RequestMethod.GET)
	public String uploadAjax(Model model){
		try {
			model.addAttribute("list", service.galleryList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSP_PAGE+"/uploadform";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST,
				produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(HttpServletRequest request, 
				MultipartFile file, GalleryDTO dto) throws Exception{
		
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " +file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		long maxSize  = 7340032;    //7MB
		
		if(file.getSize() >maxSize){
			
			return new ResponseEntity<String>("파일을 7MB 이하로 올려 주세요", HttpStatus.CREATED);
		}
		
		String type =file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1) ;
		logger.info(" type : "  +type);
		if( !MediaUtils.getImageConfirm(type)){
			return new ResponseEntity<String>("jpg, gif, png, 이미지만 가능합니다.", HttpStatus.CREATED);
		}
		
		String filePathNmae=UploadFileUtils.uploadFile(UploadPath.path(request),
				file.getOriginalFilename(), file.getBytes());
		
		dto.setFileName(file.getOriginalFilename()); //원본이름
		dto.setFilePath(filePathNmae);//년 월 일 / 파일 이름
		dto.setFileSize(file.getSize());
		dto.setFileTypes(type);
		service.insertGallery(dto);
		
		return new ResponseEntity<String>(filePathNmae
				, HttpStatus.CREATED);
		
	}
	
	
	
	@RequestMapping(value="/get_gallery_list", method=RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<GalleryDTO>> getGalleryList(){
		ResponseEntity<List<GalleryDTO>> entity =null;
	
		try{
			List<GalleryDTO> list=service.galleryList();
			entity =new ResponseEntity<List<GalleryDTO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<List<GalleryDTO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(HttpServletRequest request, String fileName) throws Exception{
		
		InputStream in =null;
		
		ResponseEntity<byte[]> entity =null;
		
		logger.info("FILE NAME : " + fileName);
		
		try{
			String formatName =fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType =MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers =new HttpHeaders();
			
			in =new FileInputStream(UploadPath.path(request)+fileName);
			
			if(mType !=null){
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.indexOf("_")+1);
				String str="attachment; filename=\"";
					   str +=new String(fileName.getBytes(), "ISO-8859-1");
					   str +="\"";
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", str);
			}
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, 
														HttpStatus.CREATED);
			//실제로 데이터를 읽는 부분은 commons 라이브러리의 기능을 활용해서
			// 대상 파일에서 데이터를 읽어내는 IOUtils.toByteArray() 입니다.
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	
	
	
	
}



