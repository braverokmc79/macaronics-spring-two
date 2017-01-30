package com.macaronics.www.admin.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.macaronics.www.admin.model.dto.AdminMainBannerVO;
import com.macaronics.www.admin.service.AdminMainBannerService;
import com.macaronics.www.util.fileupload.UploadPath;



@Controller
@RequestMapping(value="/admin/mainBanner")
public class AdminMainBannerController {

	
	private static final Logger logger=LoggerFactory.getLogger(AdminMainBannerController.class);
	
	
	@Inject
	private AdminMainBannerService adminMainBannerService;

	private final String JSP_PAGE ="/admin/mainbanner/";
	
	
	private final String PATH ="WEB-INF/uploads/mainbanner";
	
	// 등록 폼
	@RequestMapping(value="/registerForm", method=RequestMethod.GET)
	public String mainBannerForm(){
		
		return JSP_PAGE+"mainBannerWrite";
	}
	
	
	
	// 등록
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String mainBanner(@ModelAttribute AdminMainBannerVO vo, HttpServletRequest request)
		throws Exception{
	/*
		logger.info("업로드 파일 정보" + vo.getDisplay() + 
				" originalname :" +vo.getFile().getOriginalFilename() );
	*/	
		String savedName =uploadFile(request, vo.getFile().getOriginalFilename(), vo.getFile().getBytes());
		
		vo.setImg_url(savedName);
		
		adminMainBannerService.mainBannerInsert(vo);
		
		return "redirect:bannerlist";
	}
	
	
	
	private String uploadFile(HttpServletRequest request ,String originalName , byte[] fileData) 
			throws Exception {
		
		UUID uid =UUID.randomUUID();
		
		String savedName =uid.toString() +"_"+originalName;
		
		UploadPath.attach_path=PATH;
		File target=new File(UploadPath.path(request), savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	// 배너 리스트
	@RequestMapping(value="/bannerlist", method=RequestMethod.GET)
	public String bannerList(Model model){
		List<AdminMainBannerVO> list =adminMainBannerService.mainBannerList();
		
/*		for(AdminMainBannerVO vo :list){
			
			logger.info(" 배너 리스트  "  +vo.toString());
		}*/
		
		model.addAttribute("count", adminMainBannerService.mainBannerCount());
		model.addAttribute("list", list);
		return  JSP_PAGE+"bannerList";
	}
	
	
	
	//수정폼
	@RequestMapping(value="/updateForm/{idx}", method=RequestMethod.GET)
	public String bannerUpdateForm(@PathVariable("idx") Integer idx,   Model model){
		
		AdminMainBannerVO vo =adminMainBannerService.getMainBanner(idx);
		
		if(vo==null){
			return "redirect:bannerlist";
		}
		
		model.addAttribute("vo", vo);
		//logger.info(" updateForm : " + vo.toString());
		return JSP_PAGE +"mainBannerUpdate";
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String bannerUpdate(@ModelAttribute AdminMainBannerVO vo, HttpServletRequest request)
		throws Exception{
		
		//logger.info(" AdminMainBannerVO : " + vo.toString());
		
		if(vo.getFile().isEmpty()){
			vo.setImg_url(vo.getOldImg());
			adminMainBannerService.mainBannerUpdate(vo);
			
		}else{
			
			UploadPath.attach_path=PATH;
			
			File file=new File(UploadPath.path(request), vo.getOldImg());
			if(file.isFile()){
				file.delete();
			}
			
			
			String savedName =uploadFile(request, vo.getFile().getOriginalFilename(), vo.getFile().getBytes());
			vo.setImg_url(savedName);
			adminMainBannerService.mainBannerUpdate(vo);
		}
		
		return "redirect:bannerlist";
	}
	

	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String mainBannerDelete(@RequestParam Integer idx ){

		adminMainBannerService.mainBannerDelete(idx);
		
		return "redirect:bannerlist";
	}
	
	
	
	
}










