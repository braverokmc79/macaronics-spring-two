package com.macaronics.www.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.macaronics.www.admin.model.dto.AdminEmailVO;
import com.macaronics.www.admin.service.AdminEmailService;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping("/admin/mail")
public class AdminMailController {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminMailController.class);
	
	private final String JSP_PAGE ="/admin/mail/";
	
	@Inject
	private AdminEmailService adminEmailService;
	
	
	private final String PATH="WEB-INF/uploads/mailbox/";
	
	
	@RequestMapping(value="/composeForm", method=RequestMethod.GET)
	public String mailComposeForm(){
		
	
		return JSP_PAGE+"compose";
	}
	
	
	
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String mailComposeAction(AdminEmailVO vo, HttpServletRequest request){
		
		adminEmailService.senderEmail(vo, request);
		
		return "redirect:composeForm";
	}
	
	
	@RequestMapping(value="/ckeditorupload")
	public void imageUpload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam MultipartFile upload) throws Exception{
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		OutputStream out=null;
		PrintWriter printWriter =null;
		
		logger.info("ckediotr 업로드");
		try{
			
			String fileName =upload.getOriginalFilename();
			
			byte[] bytes=upload.getBytes();
			
			UploadPath.attach_path=PATH;
			String uploadPath =UploadPath.path(request)+fileName;
			
			logger.info("Ckeditor 업로드 경로 :" + uploadPath);
			
			out=new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			
			String callback=request.getParameter("CKEditorFuncNum");
			
			printWriter=response.getWriter();
			
			String fileUrl ="/mailbox/"+fileName;
			
			String script="<script>";
			script +="window.parent.CKEDITOR.tools.callFunction(";
			script +=callback;
			script +=", '";
			script +=fileUrl;
			script +="', '이미지를 업로드 했습니다.' )";
			script +="</script>";
			
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
	
	
	@RequestMapping(value="/senderEmailList")
	public String mailList(Model model, PageAndSearch pas){
	
	   int count =adminEmailService.emailCount(pas);
	  
	   if(pas.getCurPage()==null){
		   pas.setCurPage(1);
	   }
	   
	  
	   Pager.PAGE_SCALE=50;
	   Pager pager =new Pager(count, pas.getCurPage());
	   int start =pager.getPageBegin();
	   int end=pager.getPageEnd();
	
	   pas.setStart(start);
	   pas.setEnd(end);
	   
	   List<AdminEmailVO> emailList=adminEmailService.emailList(pas);
	   
	   
	   model.addAttribute("count", count);
	   model.addAttribute("emailList", emailList);
	   model.addAttribute("pager", pager);
	   model.addAttribute("pas", pas);
	   
	  return JSP_PAGE+"senderEmailList";
	}
	
	
	
	@RequestMapping(value="/maildelete/{idx}", method=RequestMethod.GET)
	public String mailDelete(@PathVariable("idx") Integer idx){
	
		adminEmailService.deleteEmail(idx);
		
		return "deleted";
	}
	
	

}


