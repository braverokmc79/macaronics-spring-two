package com.macaronics.www.user.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping(value="/gallery/view")
public class GalleryController {

	
	private static final String JSP_PAGE ="/view/gallery";
	
	private Logger logger=LoggerFactory.getLogger(GalleryController.class);
	
	@Inject
	private GalleryService service;
	
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String galleryPage(Model model){	
		try {
			
			List<GalleryDTO> galleryList =service.galleryList();
			
			for(GalleryDTO dto :galleryList){
				
				String filePath =dto.getFilePath();
				String front=filePath.substring(0, 12);
				String end=filePath.substring(14);
				dto.setFilePath(front+end);
				
			}
			
			
			model.addAttribute("galleryList",	galleryList );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return JSP_PAGE+"/gallery";
	}
	
	
	
	@RequestMapping(value="/gallery2", method=RequestMethod.GET)
	public String galleryPage2(){
		
		return JSP_PAGE+"/gallery2";
	}
	

	@ResponseBody
	@RequestMapping(value="/gallery2", method=RequestMethod.POST , produces="text/palin;charset=UTF-8")
	public ResponseEntity<String> galleryPage2(HttpServletRequest request, MultipartFile file ,Model model)
			throws Exception{
		
		logger.info("originalName :" + file.getOriginalFilename());
		logger.info("size  :  "+ file.getSize());
		logger.info("contentType : " + file.getContentType());
		String fileName=UploadFileUtils.uploadFile(UploadPath.path(request),
				file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(fileName, HttpStatus.OK);
	}
	
	
	
	//이미지 표시 기능
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(HttpServletRequest request, String fileName) throws Exception{
		InputStream in=null;
		ResponseEntity<byte[]> entity=null;
		try{
			String formatName=fileName.substring(
					fileName.lastIndexOf(".") +1);
			
			MediaType mType =MediaUtils.getMediaType(formatName);
			HttpHeaders  headers =new HttpHeaders();
			in=new FileInputStream(UploadPath.path(request)+fileName);
			if(mType !=null){
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.indexOf("_")+1 );
				String str ="attachment; filename=\"";
				str +=new String(fileName.getBytes("utf-8"), "ISO-8859-1");
				str +="\"";
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", str);
			}
			
			entity =new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers
						, HttpStatus.CREATED);
			
			
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(HttpServletRequest request, String fileName){
		
		logger.info(" delete File : " + fileName);
		
		String forMatName =fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType =MediaUtils.getMediaType(forMatName);
		
		if(mType!=null){
			//원본 이미지 삭제
			
			String front = fileName.substring(0, 12);
			String end =fileName.substring(14);
			
			File file =new File(UploadPath.path(request)+(front+end).replace('/', File.separatorChar));
			if(file.exists()){
				file.delete();
			}
			
		}
		//썸네일 이미지 및 일반 파일 삭제
		new File(UploadPath.path(request)+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	
	
}







