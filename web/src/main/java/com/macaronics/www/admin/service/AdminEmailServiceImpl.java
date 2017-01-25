package com.macaronics.www.admin.service;

import java.io.File;
import java.util.List;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.macaronics.www.admin.model.dao.AdminEmailDAO;
import com.macaronics.www.admin.model.dto.AdminEmailVO;
import com.macaronics.www.util.fileupload.UploadPath;
import com.macaronics.www.util.oralce.PageAndSearch;

@Service
public class AdminEmailServiceImpl implements AdminEmailService{

	
	private final static Logger logger =LoggerFactory.getLogger(AdminEmailServiceImpl.class);
	
	@Inject
	private AdminEmailDAO adminEmailDAO;
	
	@Inject
	private JavaMailSender javaMailSender;
	
	@Override
	public void senderEmail(AdminEmailVO vo , HttpServletRequest request) {
		
		MimeMessage message =javaMailSender.createMimeMessage();
		try{
			
			//true 이면 multipart 여부
			MimeMessageHelper messageHelper=new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(vo.getSubject());
			messageHelper.setText(vo.getMessage(), true); //true 면 html 형식
			
			
			messageHelper.setFrom(vo.getSenderMail(), "운영자");
			messageHelper.setTo(new InternetAddress(vo.getReceiveMail(), "utf-8"));
			
				
			String filePath =UploadPath.path(request);
			
			
			//첨부파일이 있는 경우
			if(vo.getFiles().getOriginalFilename()!=null ){
				logger.info("첨부파일이 있는 경우"+ vo.getFiles().getOriginalFilename());
					//서버에 임시 저장 을 한다.
					File target =new File(filePath, vo.getFiles().getOriginalFilename());
					
					FileCopyUtils.copy(vo.getFiles().getBytes(), target);
				
					//서버에 저장 된 파일을 보낸다. 
					DataSource dataSource =new FileDataSource(filePath+vo.getFiles().getOriginalFilename());
					messageHelper.addAttachment(MimeUtility.encodeText(
							vo.getFiles().getOriginalFilename(), "utf-8", "B"
							), dataSource);
					
				
					
					//메일 보내기
					javaMailSender.send(message);
			
					//서버에 저장된 파일을 삭제 한다.
					File file =new File(filePath+vo.getFiles().getOriginalFilename());
					if(file.exists()){
						file.delete();
						logger.info("첨부 파일 삭제 완료");
					}

			}else{
				//첨부파일이 없는 경우
				//메일 보내기
				javaMailSender.send(message);
			}
			
			//DB에 보낸 메일 저장
			adminEmailDAO.senderEmail(vo);
			
			
			

		}catch(Exception e){
			
			e.printStackTrace();
		}		
	}

	
	
	
	@Override
	public List<AdminEmailVO> emailList(PageAndSearch pas) {
		
		return adminEmailDAO.emailList(pas);
	}
	
	

	@Override
	public void deleteEmail(Integer idx) {
		adminEmailDAO.deleteEmail(idx);
	}




	@Override
	public int emailCount(PageAndSearch pas) {
		// TODO Auto-generated method stub
		return adminEmailDAO.emailCount(pas);
	}

}
