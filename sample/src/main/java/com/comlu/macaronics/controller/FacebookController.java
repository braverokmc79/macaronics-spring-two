package com.comlu.macaronics.controller;

import javax.servlet.http.HttpSession;

import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comlu.macaronics.DTO.MacaronicUser;

@Controller
public class FacebookController {
	//페이스북 API 객체  페이스북 자료를 가져온다.
	private Facebook facebook; 
	//페이스북 연결 정보 페이스북에 로그인을 했는지 여부
	private ConnectionRepository cr; 
	
	public FacebookController ( Facebook facebook, ConnectionRepository cr){
		
		this.facebook =facebook;
		this.cr=cr;
		
	}
	
	@RequestMapping("/")
	public String home(HttpSession session, Model model  ){
		if(cr.findPrimaryConnection(Facebook.class) ==null){
			//페이스북에 로그인되어 있지 않을 때
			return "redirect:/member/login";//로그인으로 이동
		}else{
			//페이스북에 로그인되어 있을 때
			String[] fields={"id", "name", "birthday"
					, "email", "gender"};
			
			//페이스북 정보 검색 User 클래스는 페이스북 유저클래스
			User user =facebook.fetchObject("me", User.class, fields);
			
			String name=user.getName();
			String id=user.getId();
			String birthday=user.getBirthday();
			String email=user.getEmail();
			String gender=user.getGender().equals("male") ? "남" : "여";
			
			MacaronicUser macaronicUser =new MacaronicUser(name, id, birthday, email, gender);
			
			
			//feed 정보 저장
			PagedList<Post> feed =facebook.feedOperations().getFeed();
			model.addAttribute("feed", feed);
			
			model.addAttribute("name", name);
			//세션에 저장
			session.setAttribute("macaronicUser", macaronicUser);
		}
		return "main"; 
	}
	

	
	
	
	
}
