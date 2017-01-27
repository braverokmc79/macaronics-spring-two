package com.comlu.macaronics.service;

import java.util.List;

import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;

import com.comlu.macaronics.dto.FacebookFeedVO;

public interface FacebookFeedService {

	public void insert(PagedList<Post> feed , String id);
	public List<FacebookFeedVO> list(String id);
	public FacebookFeedVO get(String id);
	public void delete(String id);
	public int count(String id);
	
	
}
