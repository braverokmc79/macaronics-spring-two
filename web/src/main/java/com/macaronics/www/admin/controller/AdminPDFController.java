package com.macaronics.www.admin.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
import com.macaronics.www.member.model.dto.board.BoardVO;
import com.macaronics.www.member.service.board.BoardService;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.oralce.PageAndSearch;
import com.macaronics.www.util.oralce.Pager;

@Controller
@RequestMapping("/admin/pdf")
public class AdminPDFController {

	private static final Logger logger =LoggerFactory.getLogger(AdminPDFController.class);
	
	private final String JSP_PAGE="/admin/pdf/";
	
	private final String FONT_PATH="/resources/font/malgun.ttf";
	
	private final String PDF_CSS="/resources/admin/dist/css/AdminLTE.css";
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String pdfboardList(PageAndSearch pas , Model model){
	 
		int count =boardService.countArticle(pas.getSearch_option(), pas.getKeyword());
		
		//페이지 나누기 관련 처리
		if(pas.getCurPage()==null){pas.setCurPage(1);}
		

		Pager pager =new Pager(count, pas.getCurPage());
		int start =pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardVO> list=boardService.boardList(start, end, pas.getSearch_option(), pas.getKeyword());
		
		Map<String, Object> map =new HashMap<>();
		map.put("countList", count);
		map.put("list", list);
		map.put("pager", pager);
			
		model.addAttribute("map", map);
		model.addAttribute("pageAndSearch", pas);
		
				
		return JSP_PAGE +"boardpdf"; 
	}
	
	
	@RequestMapping(value="/boardWrite/{bno}", method=RequestMethod.GET)
	public ResponseEntity<String> boardOutput(@PathVariable("bno") Integer bno   ,HttpServletRequest request) throws Exception{
		ResponseEntity<String> entity=null;
	
		//logger.info("bno  : " + bno);
		UploadPath.attach_path=FONT_PATH;
		String uploadPath =UploadPath.path(request);
		
		UploadPath.attach_path=PDF_CSS;
		String pdf_css_uploadpath =UploadPath.path(request);
		
		BoardVO vo =boardService.getBoard(bno);
		try {
				//com.itextpdf.text.Document
				Document document=new Document();//pdf 문서 객체 생성
				//pdf wirter 객체
				PdfWriter writer =PdfWriter.getInstance(document, 
						new FileOutputStream("D:\\"+vo.getTitle()+".pdf"));
				document.open(); // pdf 문서 열기
				BaseFont baseFont=BaseFont.createFont(
						uploadPath,
						BaseFont.IDENTITY_H, BaseFont.EMBEDDED );
			
				
				Font font=new Font(baseFont, 12);//폰트 설정
				PdfPTable table=new PdfPTable(5);//5 컬럼의 테이블
				Chunk chunk =new Chunk("게시판", font);// 출력할 내용
				
				Paragraph ph =new Paragraph(chunk);//문단
				ph.setAlignment(Element.ALIGN_CENTER);//가운데 정렬
				document.add(ph);
				
				//줄바꿈
				document.add(Chunk.NEWLINE);
				document.add(Chunk.NEWLINE);
				
				//테이블의 타이틀 행 생성
				PdfPCell cell1 =new PdfPCell(new Phrase("번호", font));
				cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell1);
				PdfPCell cell2 =new PdfPCell(new Phrase("제목", font));
				cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell2);
				PdfPCell cell3 =new PdfPCell(new Phrase("이름", font));
				cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell3);
				PdfPCell cell4 =new PdfPCell(new Phrase("날짜", font));
				cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell4);
				PdfPCell cell5 =new PdfPCell(new Phrase("조회수", font));
				cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell5);
				
				
				PdfPCell cellBno=new PdfPCell(new Phrase(""+vo.getBno(), font));
				cellBno.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cellBno); //번호
				PdfPCell cellName=new PdfPCell(new Phrase(vo.getWriter(), font));
				cellName.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cellName);// 유저이름
				PdfPCell cellTitle =new PdfPCell(new Phrase(vo.getTitle(), font));
				cellTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cellTitle); //제목
				
				Date date =vo.getRegdate();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String srtDate =sdf.format(date);
				PdfPCell cellDate =new PdfPCell(new Phrase(srtDate, font));
				cellDate.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cellDate); //날짜
				
				PdfPCell cellCount=new PdfPCell(new Phrase(""+vo.getViewcnt(), font));
				cellCount.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cellCount);//조회수
				
				
				PdfPTable table2=new PdfPTable(1);//2 테이블
				PdfPCell table2_cell1 =new PdfPCell(new Phrase("내용", font));
				table2_cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table2.addCell(table2_cell1);
				PdfPCell table2_content =new PdfPCell(new Phrase(vo.getContent(), font));
				table2.addCell(table2_content);
				
				
				 //document.newPage(); //페이지 나누기
		/*		
				///여기서 부터  Html 변화 작업
				XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
				// CSS
				CSSResolver cssResolver = new StyleAttrCSSResolver();
				CssFile cssFile = helper.getCSS(new FileInputStream(pdf_css_uploadpath));
				cssResolver.addCss(cssFile);
				
				// HTML, 폰트 설정
				XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
				fontProvider.register(uploadPath, "MalgunGothic"); // MalgunGothic은 alias,
				CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
				
				
				HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
				htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
				 
				
				// Pipelines
				PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
				HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
				CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
				 
				XMLWorker worker = new XMLWorker(css, true);
				XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
				 
				// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
				String htmlStr =vo.getContent() ;
				 
				StringReader strReader = new StringReader(htmlStr);
				xmlParser.parse(strReader);
				
				
				PdfPCell cellCountent=new PdfPCell(xmlParser.parse(strReader));
				table2.addCell(cellCountent);//내용
				
				*/
				document.add(table);
				document.add(table2);//두번째 "내용 테이블"  
				document.close();//pdf 문서 닫기
				
				entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity; //views/pdf/list.jsp 로 포워딩
	}
	
	
	
	
	
	
}
