package com.comlu.macaronics.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.comlu.macaronics.dto.FacebookFeedVO;
import com.comlu.macaronics.dto.MacaronicUser;
import com.comlu.macaronics.service.FacebookFeedService;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class FacebookController {
	//페이스북 API 객체  페이스북 자료를 가져온다.
	private Facebook facebook; 
	//페이스북 연결 정보 페이스북에 로그인을 했는지 여부
	private ConnectionRepository cr; 
	
	@Inject
	private FacebookFeedService facebookFeedService;

	private static final Logger logger=LoggerFactory.getLogger(FacebookController.class);
	
	
	public FacebookController ( Facebook facebook, ConnectionRepository cr){
		
		this.facebook =facebook;
		this.cr=cr;
		
	}
	
	
	
	@RequestMapping("/member/login")
	public String login(){
		
		return  "/member/login";
	}
	
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return  "redirect:/";
	}
	
	
	
	
	@RequestMapping("/")
	public String home(HttpSession session, Model model  ){
		if( session.getAttribute("macaronicUser") !=null  && cr.findPrimaryConnection(Facebook.class) ==null){
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
			
			//로그인 정보 아이디와 피드목록의 글 적은 아이디가 다르다. 따라서 로그인 정보 아이디 저장
			model.addAttribute("feed", feed);
			
			
			String feed_name=feed.get(0).getFrom().getName();
			Date createTime=feed.get(0).getCreatedTime();
			String feed_message=feed.get(0).getMessage();
			String feed_picture=feed.get(0).getPicture();
			
			String feed_id=feed.get(0).getId();
			
			
			logger.info("이름 : " + feed_name);
			logger.info("날짜 : " + createTime);
			logger.info("메시지 : " + feed_message);
			logger.info("이미지 : " + feed_picture);
			logger.info("아이디 : " + feed_id + " :  feed.get(0).getFrom().getId()  :" +feed.get(0).getFrom().getId());
		
			
			
			
			///// 로그인 정보 아이디 저장
			facebookFeedService.insert( feed, id);
			
			model.addAttribute("name", name);
			//세션에 저장
			session.setAttribute("macaronicUser", macaronicUser);
			
			//thymeleaf
			
			model.addAttribute("id", id);
			model.addAttribute("birthday", birthday);
			model.addAttribute("email", email);
			model.addAttribute("gender", gender);
			
		}
		return "main"; 
	}
	

	//피드 목록 출력
	@RequestMapping("/member/feed")
	public ModelAndView feed(HttpSession session, ModelAndView mav){
		
		
	
		MacaronicUser user =(MacaronicUser)session.getAttribute("macaronicUser");
		if(user!=null){
			
			logger.info(" /member/feed 로그인 정보 : " +user.toString());
		
			List<FacebookFeedVO> list=  facebookFeedService.list(user.getId());
			
			for(FacebookFeedVO vo : list){
				logger.info(" FacebookFeedVO 정보 : " +vo.toString());
			}
			
			mav.addObject("feed", list);
		
		}
		
		
		
		mav.setViewName("/member/feed");
		return mav;
	}
	
	
	
	
}
