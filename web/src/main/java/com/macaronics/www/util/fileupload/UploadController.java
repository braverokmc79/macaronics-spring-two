package com.macaronics.www.util.fileupload;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.admin.service.AdminCategoryService;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.service.ProductService;

@Controller
@RequestMapping(value="/upload")
public class UploadController {

	
	private static final Logger logger=LoggerFactory.getLogger(UploadController.class);
	
	
	private static final String JSP_PAGE ="/view/uploads"; 
	
	
	@Inject
	private ProductService productService;
	
	@Inject
	private AdminCategoryService adminCategoryService;
	
	
	
	@RequestMapping(value="/uploadForm",  method=RequestMethod.GET)
	public String uploadForm(Model model){

		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		//조회수가 많은 상품을 가져온다.
		List<ProductShopVO> viewsProduct =productService.viewsProduct();
		model.addAttribute("vbp", viewsProduct);
		
		return JSP_PAGE +"/upload";
	}
	
	
	
//업로드 버튼 =>업로드 완료 =>파일 정보가 file 에 저장		
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public String upload(MultipartFile file,  RedirectAttributes rttr,
		HttpServletRequest request
			) throws Exception{
		
		logger.info("파일 이름 :" + file.getOriginalFilename());
		
		logger.info("파일 크기 :"+ file.getSize());
		logger.info("컨텐트 타입 : " + file.getContentType());
		
		
		String savedName =uploadFile(request, file.getOriginalFilename(), file.getBytes());
		
		rttr.addFlashAttribute("savedName", savedName);
		rttr.addFlashAttribute("realName", file.getOriginalFilename());
	
		return "redirect:uploadForm";

	}
	
	
	private String uploadFile (HttpServletRequest request, 
			String originalName, byte[] fileData) throws Exception{
		
		UUID  uid =UUID.randomUUID();
		
		String savedName =uid.toString() +"_" +originalName;
		
		File target =new File(UploadPath.path(request),savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	
	@RequestMapping(value="/uploadiframe", method=RequestMethod.GET)
	public String uploadFormIframe(Model model) {
		
		//1차 카테고리 목록 불러오기
		model.addAttribute("categoryOne", adminCategoryService.categoryOneList());
		
		//조회수가 많은 상품을 가져온다.
		List<ProductShopVO> viewsProduct =productService.viewsProduct();
		model.addAttribute("vbp", viewsProduct);
		
		return JSP_PAGE+"/uploadiframe";
	}
	
	
	
	
	
	@RequestMapping(value="/uploadiframe", method=RequestMethod.POST)
	public String uploadFormIrame(HttpServletRequest request,
			MultipartFile file, Model model) throws Exception{
		
		logger.info("originalName :" + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType :" +file.getContentType());
		
		String savedName =uploadFile(request, file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return JSP_PAGE+"/uploadiframeResult";
	}
	
	
	
	
	
	
	
	
	
	
		
}


