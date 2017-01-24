package com.macaronics.www.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.macaronics.www.admin.service.AdminCouponService;
import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.user.model.dto.CouponVO;
import com.macaronics.www.user.service.CouponService;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;
import com.macaronics.www.util.upload.UploadFileUtils;

@Controller
@RequestMapping(value="/admin/coupon")
public class AdminCouponController {

	
	private static final Logger logger =LoggerFactory.getLogger(AdminCouponController.class);
	
	@Inject
	private AdminCouponService adminCouponService;
	
	
	@Inject
	private CouponService couponService;
	
	
	private final String JSP_PAGE ="/admin/coupon/";
	
	private final String PATH ="WEB-INF/uploads/coupon";

	
	
	
	@RequestMapping(value="/registerForm", method=RequestMethod.GET)
	public String coponRegisterForm(){
		
		return JSP_PAGE+"couponregister";
	}
	
	
	@RequestMapping(value="/insertcoupon", method=RequestMethod.POST
			, produces="text/plain; charset=UTF-8")
	public String couponRegister(@ModelAttribute CouponVO vo, HttpServletRequest request)
		throws Exception{
		
		UploadPath.attach_path=PATH;
		
		String savedName=UploadFileUtils.uploadFile(UploadPath.path(request), 
				vo.getFiles().getOriginalFilename(),
				vo.getFiles().getBytes());
		
		logger.info("업로드 파일 정보 : " + savedName);
		
		//DB데이터 저장
		vo.setImg_url(savedName);
		adminCouponService.couponInsert(vo);
		
		return "redirect:couponList";
	}
	
	
	@RequestMapping(value="/couponList", method=RequestMethod.GET)
	public String couponList(Model model, PageAndSearch pas){
		
		
		int count =adminCouponService.countArticle(pas.getSearch_option(), pas.getKeyword());
		
		//페이지 나누기 관련 처리
		if(pas.getCurPage()==null){pas.setCurPage(1);}
		

		Pager pager =new Pager(count, pas.getCurPage());
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		
		logger.info(" ****************   " + pas.toString() + "    메서드  : " + pas.searchQuery(1) +
				"  count : " + count + " start : " + start + "  end  : " + end);
		
		List<CouponVO> list=adminCouponService.getCouponList(start, end, pas);
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("pager", pager);
	
		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);
		
		
		
		model.addAttribute("list", list);
		return JSP_PAGE+"coponList";
	}
	
	
	
	
	//쿠폰 업데이트 폼
	@RequestMapping(value="/couponUpdateForm/{idx}", method=RequestMethod.GET)
	public String updateCouponform(@PathVariable("idx") Integer idx, Model model){
		
		CouponVO vo=adminCouponService.couponUpdateForm(idx);
		model.addAttribute("CouponVO", vo);
		return JSP_PAGE+"couponAlter";
	}
	
	
	//쿠폰 업데이트
	@RequestMapping(value="/couponUpdate", method=RequestMethod.POST)
	public String updateCoupon(@ModelAttribute CouponVO vo, HttpServletRequest request){	
		try{	
			if(vo.getFiles().isEmpty()){
				//기존 이미지 oldImg 저장 처리
				logger.info("파일 첨부를 하지 않고 기존 이미지 사용하는 경우");	
				vo.setImg_url(vo.getOldImg());
				
				
				adminCouponService.couponUpdate(vo);
				
			}else{
				    logger.info("새로운 이미지를 사용하는 경우");
					//기존 이미지 삭제 처리
					UploadPath.attach_path=PATH;
					String imagePath =UploadPath.path(request);
					logger.info("imagePath : " +imagePath );
					
					//썸네일 삭제
					File file =new File(imagePath+ vo.getOldImg().replace('/', File.separatorChar));
					if(file.exists()){
						file.delete();
					}
					
					//원본 이미지 삭제
					String front =vo.getOldImg().substring(0, 12);
					String end =vo.getOldImg().substring(14);
					File file2=new File(imagePath +(front+end).replace('/',File.separatorChar));
					if(file2.exists()){
						file2.delete();
					}
					
					//이미지 파일 저장
				    String savedName=UploadFileUtils.uploadFile(imagePath, 
							vo.getFiles().getOriginalFilename(),
							vo.getFiles().getBytes());
					
					logger.info("업로드 파일 정보 : " + savedName);
					
					//DB데이터 저장
					vo.setImg_url(savedName);
					adminCouponService.couponUpdate(vo);
					
				}
				//adminCouponService.couponUpdate(vo);
				
		  }catch(Exception e){
					e.printStackTrace();
		  }
		  return "redirect:/coupon/read.do/"+vo.getIdx();
	}
	
	
	@RequestMapping(value="/coupondelete", method=RequestMethod.POST)
	public String couponDelete(@RequestParam Integer idx, HttpServletRequest request) throws Exception{
		
		CouponVO vo =couponService.getRead(idx);
		//기존 이미지 삭제 처리
		UploadPath.attach_path=PATH;
		String imagePath =UploadPath.path(request);
		logger.info("imagePath : " +imagePath );
		
		//썸네일 삭제
		File file =new File(imagePath+ vo.getImg_url().replace('/', File.separatorChar));
		if(file.exists()){
			file.delete();
		}
		
		//원본 이미지 삭제
		String front =vo.getImg_url().substring(0, 12);
		String end =vo.getImg_url().substring(14);
		File file2=new File(imagePath +(front+end).replace('/',File.separatorChar));
		if(file2.exists()){
			file2.delete();
		}
		
		
		//DB 삭제
		adminCouponService.couponDelete(idx);
		
		return "redirect:couponList";
	}
	
	
	
}












