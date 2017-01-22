package com.macaronics.www.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.admin.model.dto.AdminCategoryVO;
import com.macaronics.www.admin.model.dto.AdminProductAttchVO;
import com.macaronics.www.admin.service.AdminCategoryService;
import com.macaronics.www.admin.service.AdminShopProductService;
import com.macaronics.www.user.model.dto.ProductShopVO;
import com.macaronics.www.user.service.ProductService;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;
import com.macaronics.www.util.upload.MediaUtils;
import com.macaronics.www.util.upload.UploadFileUtils;

@Controller
@RequestMapping("/admin/shop/products")
public class AdminShopProductController {

	
	private static final String JSP_PAGE ="/admin/shop/products/";
	
	private static final String ATTACH_PATH ="WEB-INF/uploads/productsImg/";
	
	private static final Logger logger=LoggerFactory.getLogger(AdminShopProductController.class);
	
	@Inject
	private AdminCategoryService adminCategoryService;
	
	@Inject
	private AdminShopProductService adminShopProductService;
	
	
	
	@Inject
	private ProductService productService;
	
	
	@RequestMapping(value="/write")
	public String productRegisterDo(){
		
		
		return JSP_PAGE+"write";
	}
	
	
	//1차 카테고리 목록 불러오기
	@ResponseBody
	@RequestMapping(value="/categoryOneList", method=RequestMethod.GET)
	public ResponseEntity<List<AdminCategoryVO>> CategoryOneList(){
		ResponseEntity<List<AdminCategoryVO>> entity=null;
		List<AdminCategoryVO> list=null;
		try{
			list=adminCategoryService.categoryOneList();
			entity =new ResponseEntity<List<AdminCategoryVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return entity;
	}
	
	
	
	//2차 카테고리 목록 불러오기
	@ResponseBody
	@RequestMapping(value="/categoryTwoList/{idx}", method=RequestMethod.GET)
	public ResponseEntity<List<AdminCategoryVO>> CategoryTwoList(@PathVariable Integer idx){
		ResponseEntity<List<AdminCategoryVO>> entity=null;
		List<AdminCategoryVO> list=null;
		try{
			list=adminCategoryService.categoryTwoList(idx);
			entity =new ResponseEntity<List<AdminCategoryVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return entity;
	}
	
	
	//2차 카테고리 목록 불러오기
	@ResponseBody
	@RequestMapping(value="/categoryThreeList/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<AdminCategoryVO>> CategoryThreeList(@PathVariable Integer bno){
		ResponseEntity<List<AdminCategoryVO>> entity=null;
		List<AdminCategoryVO> list=null;
		try{
			list=adminCategoryService.categoryThreeList(bno);
			entity =new ResponseEntity<List<AdminCategoryVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
		}
		return entity;
	}
	
		
	
	//상품 등록 하기
	@RequestMapping(value="/insertProduct", method=RequestMethod.POST,
			produces="text/plain;charset=UTF-8")
	public String proudctInsertDo(@ModelAttribute("vo") ProductShopVO  vo , Model model){

		logger.info(vo.toString());		
		adminShopProductService.productInsert(vo);
		
		return "redirect:proudctList";
	}
	
	
	//이미지첨부
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST)
	public String uploadAjax(MultipartFile file, HttpServletRequest request, Model model, 
			RedirectAttributes rttr) throws Exception{
		
		logger.info("originalName : " + file.getOriginalFilename());
		
		String formatName=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		
		MediaType mType =MediaUtils.getMediaType(formatName);
		
		if(mType==null){
			logger.info(" mType : null" );
			rttr.addFlashAttribute("message", "이미지만 업로드 가능합니다.");
			return JSP_PAGE+"erroUpload";
		}
			
		UploadPath.attach_path=ATTACH_PATH;
		UploadPath.path(request);
		String thumNameImage =UploadFileUtils.uploadFile(UploadPath.path(request),
									file.getOriginalFilename(), file.getBytes());
		
		
		String front =thumNameImage.substring(0, 12);
		String end=thumNameImage.substring(14);
		
		model.addAttribute("originalImage", front+end);
		model.addAttribute("thumNameImage", thumNameImage);
		model.addAttribute("originalFilename", file.getOriginalFilename());
		return JSP_PAGE+"upload";
		
	}
	
	//첨부 파일 전송 기능
	@ResponseBody
	@RequestMapping("/dispalyFile")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception{
		
		InputStream in =null;
		ResponseEntity<byte[]> entity =null;
		logger.info("File Name : " + fileName);
		UploadPath.attach_path=ATTACH_PATH;
		
		try{
			String formatName =fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType =MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers=new HttpHeaders();
			
			in =new FileInputStream(UploadPath.path(request)+fileName);
			
			if(mType!=null){
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.indexOf("_")+1);
				String str ="attachment; filename=\"";
				str +=new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
				str +="\"";
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", str);
			}
			entity =new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED
					);
			
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	//관리자 상품 목록	
	@RequestMapping(value="/proudctList", method=RequestMethod.GET)
	public String proudctList(Model model, PageAndSearch pas){
		
		List<ProductShopVO> list =null;
		try{
			
			int count =productService.countArticle(pas.getSearch_option(), pas.getKeyword());
		
			//페이지 나누기 관련 처리
			if(pas.getCurPage()==null){pas.setCurPage(1);}
			
			

			if(pas.getShow()==null){
				Pager.PAGE_SCALE=20; //페이지당 20개씩 기본값
				pas.setShow(20);
			}else{
				Pager.PAGE_SCALE= pas.getShow();
			}
			if(pas.getSortby()==null || pas.getSortby().equals("")){
				pas.setSortby("product_id");
			}
			boolean sortby =false;
			//잘못된 입력 방지
			if(pas.getSortby().equals("product_id")||pas.getSortby().equals("product_name")||
					pas.getSortby().equals("price")||pas.getSortby().equals("regdate")){
				
				sortby=true;
			}
			
			if(!sortby){
				pas.setSortby("product_id");
			}
			
			Pager pager =new Pager(count, pas.getCurPage());
			int start =pager.getPageBegin();
			int end=pager.getPageEnd();
			
			//List<BoardVO> list=boardService.boardList(start, end, pas.getSearch_option(), pas.getKeyword());
			list=productService.productList(start, end, pas);
			
			Map<String, Object> map =new HashMap<>();
			map.put("countList", count);
			map.put("pager", pager);
		
			
			model.addAttribute("map",map);
			
			
			model.addAttribute("pageAndSearch",pas);
			model.addAttribute("productList" ,list);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return JSP_PAGE+"productList";
	}
	
	
	
	
	
	
	
	//관리자 상품 수정
	@RequestMapping(value="/productUpdateform/{product_id}", method=RequestMethod.GET)
	public String productUpdateForm(@PathVariable("product_id") Integer product_id
			,  Model model) {	
			try{
				ProductShopVO vo =productService.detailProduct(product_id);
				
				
				//첨부파일 불러오기
				List<String>  getAttchList=productService.getAttach(product_id);
				
				
				if(getAttchList.size() >0){
					
					List<AdminProductAttchVO> attachList=new ArrayList<>();
					for(String thumnail : getAttchList){
						AdminProductAttchVO attach = new AdminProductAttchVO();
						String front =thumnail.substring(0, 12);
						String end =thumnail.substring(14);	
						
						attach.setThumNail(thumnail);
						attach.setFullName(front+end);
						attach.setFileName(thumnail.substring(thumnail.lastIndexOf("_")+1));
						attachList.add(attach);
					}
					model.addAttribute("attachList", attachList);
				}
			
				model.addAttribute("product", vo);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return JSP_PAGE+"alter";	
	}
	
	
	//상품 수정
	@RequestMapping(value="/updateProduct", method=RequestMethod.POST)
	public String updateProduct(ProductShopVO vo){
		
		//logger.info(" -------" + vo.toString());
		
		adminShopProductService.updateProduct(vo);
		return "redirect:proudctList";
	}
	
	
	
	//첨부 파일 이미지 삭제
	@ResponseBody
	@RequestMapping(value="/imgdelete", method=RequestMethod.POST)
	public ResponseEntity<String> delteImg(@RequestParam String img, HttpServletRequest request){
		ResponseEntity<String> entity=null;
		try{
			
			logger.info("img : " +img);
			
			if(img!=null){
			  UploadPath.attach_path=ATTACH_PATH;
			  File file =new File(UploadPath.path(request) +img.replace('/', File.separatorChar));
			  file.delete();
			 
			  String front =img.substring(0, 12);
			  String end =img.substring(14);
			  new File(UploadPath.path(request) +(front+end).replace('/', File.separatorChar)).delete();
			 
			  //DB 삭제
			  adminShopProductService.delteAttachImg(img);
			}
			
			entity =new ResponseEntity<String>("deleted", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	//상품 삭제
	@RequestMapping(value="/prodductDelete", method=RequestMethod.POST)
	public String productDelete(@RequestParam Integer product_id, HttpServletRequest request, 
			RedirectAttributes rttr){
		
		int num =adminShopProductService.productOrederConfirm(product_id);
		
		logger.info(" productDelete  : product_id " + product_id +" 구매 중인 상품 확인 num :" + num);
		if(num  >0){
			rttr.addFlashAttribute("deleteErrorMessage", "구매 중인 상품은 삭제 할 수 없습니다.");
			return "redirect:proudctList"; 
		}
		
		try{
		
			//첨부파일 불러오기
			List<String>  getAttchList=productService.getAttach(product_id);
			if(getAttchList.size() >0){
				 UploadPath.attach_path=ATTACH_PATH;
				
				 logger.info(" productDelete   첨부 파일 사이즈  : 	"+ getAttchList.size() );
				 for(String thumnail : getAttchList){
					
					 File file =new File(UploadPath.path(request) +thumnail.replace('/', File.separatorChar));
					 if(file.exists()){
						 file.delete();
					 }
					 
					 //원본 삭제
					 String front =thumnail.substring(0, 12);
					 String end =thumnail.substring(14);
					 File file2=new File(UploadPath.path(request) +(front+end).replace('/', File.separatorChar));
					 if(file2.exists()){
						 file2.delete();
					 }
				}
				//DB : product_id 를 가진 이미지 전체 삭제
				 adminShopProductService.deleteAttach(product_id);	
				 
			}
			//DB 삭제
			 logger.info(" productDelete   //DB 삭제");
			adminShopProductService.productDelete(product_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:proudctList";
	}
	
	
	
	
	
}














