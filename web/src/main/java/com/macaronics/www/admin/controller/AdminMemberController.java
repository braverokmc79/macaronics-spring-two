package com.macaronics.www.admin.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.service.MemberService;
import com.macaronics.www.util.passwordencoder.PasswordEncoding;

@Controller
@RequestMapping(value="/admin")
public class AdminMemberController {

	private static final String JSP_PAGE="/admin/member/";
	
	private static final Logger logger =LoggerFactory.getLogger(AdminMemberController.class);
	
	@Inject
	private MemberService memberService;
	
	
	@Inject
	PasswordEncoding passwordEncoding;
	
	
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void admin_index(){
	 
	}
	
	
	@RequestMapping(value="/memberList.do", method=RequestMethod.GET)
	public String adminMemberList(Model model){
		
		List<MemberDTO> list=memberService.memberList();
		model.addAttribute("list", list);
		
		return JSP_PAGE+"member_list";
	}
	
	
	
	@RequestMapping(value="/memberWriter.do", method=RequestMethod.POST)
	public String adminMemberWrighter(@ModelAttribute MemberDTO memberdto , RedirectAttributes rttr) throws Exception{
		
		if(memberdto.getUserpw().equals(memberdto.getConfirmPassword())){
			
			if(memberService.userAndEmailConfirm(memberdto)){
				
				String password =passwordEncoding.encode(memberdto.getUserpw());
				memberdto.setUserpw(password);
				
				memberService.insertMember(memberdto);
				return  "/admin/member/success";
			}else{
				rttr.addFlashAttribute("memberdto", memberdto);
				rttr.addFlashAttribute("ErrorMessage", "이미 등록된 아이디 혹은 이메일 입니다.");
				return "redirect:/member/register.do";
			}
			
		}else{
			
			rttr.addFlashAttribute("memberdto", memberdto);
			rttr.addFlashAttribute("ErrorMessage", "패스워드와 패스워드 확인이 일치하지 않습니다.");
			return "redirect:/member/register.do";
		}
		
	}
	
	
	
	@RequestMapping(value="/memberInfo.do", method=RequestMethod.GET)
	public String memberInfo(Model model, @RequestParam String userid){
		
		MemberDTO dto=memberService.viewMember(userid);
		
		model.addAttribute("dto", dto);
		return JSP_PAGE+"memberInfo";
	}
	
	
	@RequestMapping(value="/memberUpdate.do", method=RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberDTO dto, RedirectAttributes rttr){
		
		
		try{
			
			memberService.updateMember(dto);
			rttr.addFlashAttribute("message", "회원정보를 변경 했습니다.");		
		}catch(Exception e){
			e.printStackTrace();
			rttr.addFlashAttribute("message", "회원정보를 변경 에 실패 했습니다.");	
		}

		return  "redirect:memberInfo.do?userid="+dto.getUserid();
	}
	
	
	@RequestMapping(value="/memberDelete.do", method=RequestMethod.POST)
	public String memberDelete(@RequestParam String userid, RedirectAttributes rttr){
		
		try{
			
			//관리자 삭제 불가
			//
			if(userid.equals("admin")){
				rttr.addFlashAttribute("message", "관리자는 삭제가 불가능 합니다.");
				return "redirect:memberInfo.do?userid="+userid;
			}
			
			memberService.deleteMember(userid);
			
			return  "redirect:memberList.do";
		}catch(Exception e){
			
			rttr.addFlashAttribute("message", "회원 삭제에 실패 했습니다.");
			return "redirect:memberInfo.do?userid="+userid;
		}
		
	}
	

	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/checkPwd", method=RequestMethod.POST)
	public void checkPwd(HttpServletResponse response   , 
			@RequestParam String userid, 
			@RequestParam String confirmPassword){
		String str ="";
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out =null;
		try{
				out=response.getWriter();
				
				String resultPwd=memberService.checkPwd(userid);
				
				logger.info("   resultPwd  "  + resultPwd);
				
				if(passwordEncoding.matches(confirmPassword, resultPwd)){
					
					str ="일치 합니다.";
					
				}else{
					
					str ="패스워드가 틀립니다.";
					
				}
		}catch(Exception e){
			e.printStackTrace();
			str ="오류 입니다.";
		}
		
		out.print(str);
	}
	
	
	
	
	
	
	

	
	
}







