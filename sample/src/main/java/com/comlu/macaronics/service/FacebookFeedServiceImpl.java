package com.comlu.macaronics.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.stereotype.Service;

import com.comlu.macaronics.dao.FacebookFeedDAO;
import com.comlu.macaronics.dto.FacebookFeedVO;

@Service
public class FacebookFeedServiceImpl implements FacebookFeedService {

	@Inject
	private FacebookFeedDAO facebookFeedDAO;
	
	@Override
	public void insert(PagedList<Post> feed) {

		try{
		
			
			if(feed.get(0).getId()!=null){
				
				//기존 데이터 삭제
				facebookFeedDAO.delete(feed.get(0).getId());
				
				for(Post post : feed){
					
					FacebookFeedVO vo =new FacebookFeedVO();
					
					
					vo.setId(post.getId());
					vo.setCreated_time(post.getCreatedTime());
					vo.setMessage(post.getMessage());
					
					if(post.getFrom().getName()!=null){
						vo.setName(post.getFrom().getName());
					}else{
						vo.setName("");
					}
										
					if(post.getPicture()!=null){
						vo.setPicture(post.getPicture());
					}else{
						vo.setPicture("");
					}
					
					facebookFeedDAO.insert(vo);
				}
				
			}
				
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public List<FacebookFeedVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FacebookFeedVO get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
