package com.comlu.macaronics.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;

import com.comlu.macaronics.dto.FacebookFeedVO;

public interface FacebookFeedDAO {
	
	String insert=" insert INTO TBL_FACEBOOK_FEED ( idx, ID, NAME, MESSAGE, PICTURE, CREATED_TIME) "
				 + " VALUES ( seq_facebook_feed.nextval , #{id}, #{name}, #{message}, #{picture}, #{created_time} )";


	
	String list=" select * from TBL_FACEBOOK_FEED  where id=#{id}  order by idx desc";
	
	String get="select * from TBL_FACEBOOK_FEED  where idx=#{idx}";
	
	String delete =" delete FROM TBL_FACEBOOK_FEED WHERE id=#{id}";
	
	String count="";
	
	
	@Insert(insert)
	public void insert(FacebookFeedVO vo);
	
	@Select(list)
	public List<FacebookFeedVO> list(String id);
	
	
	@Select(get)
	public FacebookFeedVO get(String id);
	
	
	@Delete(delete)
	public void delete(String id);
	
	
	
	
	//@Select(count)
	public int count(String id);
	
	
}
