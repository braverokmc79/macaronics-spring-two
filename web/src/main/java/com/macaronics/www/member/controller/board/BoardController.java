package com.macaronics.www.member.controller.board;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.member.service.board.BoardService;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.mysql.PageMaker;
import com.macaronics.www.util.mysql.SearchCriteria;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;
import com.macaronics.www.util.upload.MediaUtils;
import com.macaronics.www.util.upload.UploadFileUtils;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	private final String JSP_PAGE ="/view/board/";
	
	@Inject
	private BoardService boardService;
	
	
	@RequestMapping(value="/listAll.do", method=RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute("cri") SearchCriteria cri, 
			@RequestParam( required=false) Integer curPage){

		
		ModelAndView mv =null;
		
		if(SqlServerEnvironment.SQL.equals("ORACLE")){
			//Orcle DB 일 경우
			PageAndSearch pas =new PageAndSearch();
			
	
			pas.setCurPage(cri.getPage());
			if(curPage !=null){
				pas.setCurPage(curPage);
			}
		
			
			pas.setSearch_option(cri.getSearch_option());
			pas.setKeyword(cri.getKeyword());
			mv=oraclePageList(pas);
		}else{
			// MYSQL DB 일 경우
			mv =mysqlPageList(cri);
		}	
		return mv;
	}
	
	
	// 오라클 페이지 리스트 페이지 
	public ModelAndView  oraclePageList(PageAndSearch pas){
		
			ModelAndView mv =new ModelAndView();
		
			int count =boardService.countArticle(pas.getSearch_option(), pas.getKeyword());
			
			//페이지 나누기 관련 처리
			if(pas.getCurPage()==null){pas.setCurPage(1);}
			
	
			Pager pager =new Pager(count, pas.getCurPage());
			int start =pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			logger.info(" ****************   " + pas.toString() + "    메서드  : " + pas.searchQuery(1) +
					"  count : " + count + " start : " + start + "  end  : " + end);
			
			List<BoardVO> list=boardService.boardList(start, end, pas.getSearch_option(), pas.getKeyword());
			
			Map<String, Object> map =new HashMap<>();
			map.put("countList", count);
			map.put("list", list);
			map.put("pager", pager);
			/*map.put("search_option", pas.getSearch_option());
			map.put("keyword", pas.getKeyword());
			*/
				
			mv.addObject("map", map);
			mv.addObject("pageAndSearch", pas);
			
			mv.setViewName(JSP_PAGE+"list");
			
			return mv;
	}
	
	
	//Mysql 페이지 리스트 메소드
	public ModelAndView  mysqlPageList(SearchCriteria cri){
		
		ModelAndView mv =new ModelAndView();
		
		mv.addObject("list", boardService.mysqlListSearchCriteria(cri));
		
		PageMaker pageMaker =new PageMaker();
		pageMaker.setCri(cri);
		
		int count =boardService.mysqlListSearchCount(cri);
		pageMaker.setTotalCount(count);
		
		
		mv.addObject("pageMaker", pageMaker);
		mv.addObject("countList", count);
		mv.setViewName(JSP_PAGE+"mysql_list");
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeDo (){
		
		return JSP_PAGE+"write";
	}
	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertDo(@ModelAttribute  BoardVO  vo){
		logger.info("insert.do 파일 업로드 " + vo.getFiles() );	
		boardService.boardCreate(vo);
		return "redirect:listAll.do";
	}
	
	
	
	
	
	
	//조회수 증가
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String viewDo(@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Integer bno, Model model, HttpSession session){
			
		model.addAttribute("vo", boardService.boardRead(bno, session));
		
		return   JSP_PAGE+"view";
	}
	
	
	
	//업데이트 화면 으로 가기
	@RequestMapping(value="/updateform.do", method=RequestMethod.GET)
	public String updateForm(
			@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Integer bno,   Model model){
		 BoardVO  vo = boardService.getBoard(bno);
		
		 model.addAttribute("vo", vo);
		
		return JSP_PAGE+"update";
	}
	
	
	

	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(@RequestParam(required=false) Integer curPage,
			@RequestParam(required=false) Integer page,
			@ModelAttribute BoardVO vo){
		
		if(curPage !=null){
			boardService.boardUpdate(vo);
			return "redirect:listAll.do?curPage="+curPage;
		
		}else if(page !=null){
			
			boardService.boardUpdate(vo);
			return "redirect:listAll.do?page="+page;
		
		}else {
			
			boardService.boardUpdate(vo);
			return "redirect:listAll.do";
			
		}
	}
	
	
	

	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete(
			@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Integer bno){
		
		logger.info("삭제  :" + bno);
		boardService.boardDelete(bno);
		return "redirect:listAll.do";
	}
	
	
	
	
	//파일 업로드 ajax
	
	@ResponseBody
	@RequestMapping(value="/dropfileinsert.do", method=RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> fileInsertDO(HttpServletRequest request, MultipartFile file) throws Exception{
		logger.info("originalName : " + file.getOriginalFilename());
		
		ResponseEntity<String> entity=null;
		
		try {
			
			String fileName =UploadFileUtils.uploadFile(UploadPath.path(request), file.getOriginalFilename(), file.getBytes());
			
			entity=new ResponseEntity<String>(fileName , HttpStatus.CREATED);
			
		} catch (Exception e) {
			// TODO: handle exception
			entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//파일 출력
	
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> dispalyFile(HttpServletRequest request,String fileName) {
		
		InputStream in=null;
		ResponseEntity<byte[]> entity =null;
		
		String formatName =fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType =MediaUtils.getMediaType(formatName);
		
		HttpHeaders headers =new HttpHeaders();
		
		try {
			in =new FileInputStream(UploadPath.path(request) +fileName);
			if(mType!=null){
				//이미지
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.indexOf("_")+1);
				String str="attachment; filename=\"";
				str +=new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
				str +="\"";
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", str);			
			}
					
			entity =new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);	
			
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
		return entity;
	}
	
	
	//첨부 파일 가져오기
	
	@ResponseBody
	@RequestMapping(value="/getAttch/{bno}")
	public List<String> getAttach(@PathVariable("bno") Integer bno){
		
		return boardService.getAttach(bno);
	}
	
	
	
	//첨부 파일 개별 삭제
	
	@ResponseBody
	@RequestMapping(value="/getDelete", method=RequestMethod.POST)
	public ResponseEntity<String> attchOneDelete(HttpServletRequest request, @RequestBody String fileName){
		
		ResponseEntity<String > entity =null;
		
		logger.info("attchOneDelete : "+ fileName);
		try{
			String formatName =fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType =MediaUtils.getMediaType(formatName);
			logger.info("mType :" + mType);
			if(mType!=null){
				//원본 이미지 삭제
				String front=fileName.substring(0, 12);
				String end=fileName.substring(14);
				new File(UploadPath.path(request)+(front+end).replace('/', File.separatorChar)).delete();
			}
			new File(UploadPath.path(request)+fileName.replace('/', File.separatorChar)).delete();
			
			try {
				boardService.attachDelete(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			entity=new ResponseEntity<String>("deleted", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	
	
}



