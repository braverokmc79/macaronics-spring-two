package com.comlu.macaronics.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import com.comlu.macaronics.dto.FacebookFeedVO;
import com.comlu.macaronics.utility.CLOBHandler;

public interface FacebookFeedDAO {
	
	String insert=" insert INTO TBL_FACEBOOK_FEED ( idx, ID, NAME, MESSAGE, PICTURE, CREATED_TIME) "
				 + " VALUES ( seq_facebook_feed.nextval , #{id}, #{name}, #{message}, #{picture}, #{created_time} )";


	
	String list=" select * from TBL_FACEBOOK_FEED  where id=#{id}  order by idx desc";
	
	String get="select * from TBL_FACEBOOK_FEED  where idx=#{idx}";
	
	String delete =" delete FROM TBL_FACEBOOK_FEED WHERE id=#{id}";
	
	String count="";
	
	
	@Insert(insert)
	public void insert(FacebookFeedVO vo);
	
	
	
// preperty="vo 의 변숩명", column="테이블의 컬럼"
//javaType="자바클래스 자료형", jdbcType="컬럼의 자료형"
//typeHandler :jdbcType을 javaType으로 변환해 주는 변환기
	@Select(list)
	@Results(value={
			@Result(property="id", column="id"),
			@Result(property="name", column="name"),
			@Result(property="message", column="message"
				, javaType=String.class, jdbcType=JdbcType.LONGNVARCHAR
				, typeHandler=CLOBHandler.class
					),
			@Result(property="picture", column="picture"),
			@Result(property="created_time", column="created_time"),
	})
	public List<FacebookFeedVO> list(String id);
	
	
	@Select(get)
	public FacebookFeedVO get(String id);
	
	
	@Delete(delete)
	public void delete(String id);
	
	
	
	
	//@Select(count)
	public int count(String id);
	
	
}
