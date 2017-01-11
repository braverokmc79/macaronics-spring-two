package com.macaronics.www.util.fileupload;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class UploadPath {

	public static String attach_path ="resources/uploads/";
	
	public static String path(HttpServletRequest request){	
		String uploadPath ="";
		
		try{
			String root_path =request.getServletContext().getRealPath("/");
			
			uploadPath =root_path+attach_path.replace('/', File.separatorChar);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return uploadPath;
	}
	
	
}
