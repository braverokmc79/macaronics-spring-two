package com.macaronics.www.util.ckeditor;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.macaronics.www.util.fileupload.UploadPath;


@Controller
@RequestMapping("/ckeditor")
public class CKuploadController {

	
	private static final Logger logger=LoggerFactory.getLogger(CKuploadController.class);
	
	private final String PATH ="WEB-INF/uploads/";
	
	
	
	@RequestMapping(value="/couponpload")
	public void imageUpload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String path,
			@RequestParam MultipartFile upload) throws Exception{
		
		//헤더 설정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		OutputStream out=null;
		PrintWriter printWriter=null;
		
		try{
			
			//첨부파일 이름
			String fileName =upload.getOriginalFilename();
			//첨부파일을 바이트 배열로 저장
			byte[] bytes =upload.getBytes();
			
			
			UploadPath.attach_path =PATH +path+"/";
			String uploadPath =UploadPath.path(request)+fileName;
			
			
			logger.info("Ckeditor 업로드 경로 : " + uploadPath);
			
			out=new FileOutputStream(new File(uploadPath));
			out.write(bytes); //서버에 파일 업로드
			
			String callback =request.getParameter("CKEditorFuncNum");
			
			printWriter=response.getWriter();
		
			String fileUrl ="/coupon/"+fileName;
			
			String script="<script>window.parent.CKEDITOR.tools.callFunction(";
			script +=callback;
			script +=", '";
			script +=fileUrl;
			script +=" ' , '이미지를 업로드 했습니다.'";
			script +=") </script>";
			    
			printWriter.println(script);
			printWriter.flush();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(out!=null){
				out.close();
			}
			if(printWriter!=null){
				printWriter.close();
			}
			
		}
	}
	
	
	
	
	
}







