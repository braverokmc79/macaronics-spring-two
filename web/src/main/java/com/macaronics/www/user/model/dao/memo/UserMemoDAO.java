package com.macaronics.www.user.model.dao.memo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.macaronics.www.user.model.dao.memo2.UserMemoVO;

//interface + 구현 클래스 + mapper

public interface UserMemoDAO {

	String list =" select * from ( select rownum  as rn, A.*  from  ( select rownum , userid, EMAIL, friendName, idx, memo, phone, post_date from tbl_memo "
			+ " where userid=#{userid} order by idx desc )  A ) where  rn BETWEEN #{start} and #{end} ";
	
	String getMemo=" select * from tbl_memo where idx=#{idx} order by idx desc ";
	
	String  insertMemo= " INSERT  INTO TBL_MEMO (IDX, USERID, FRIENDNAME, MEMO, EMAIL, PHONE ) " 
			+ " VALUES (seq_memo.nextval, #{userid}, #{friendName}, #{memo}, #{email}, #{phone} )   ";
	
	String memoUpdate=" update TBL_MEMO SET EMAIL=#{email}, FRIENDNAME=#{friendName}, MEMO=#{memo}, PHONE=#{phone} "
			  + " where idx=#{idx}  ";
	
	String  memoDelete= " delete from TBL_MEMO  WHERE IDX =#{idx} ";
	
	String countMemo=" select count(*) FROM  tbl_memo where userid=#{userid} ";
	
	/*
	@Results({
        @Result(property = "idx", column = "idx"),
        @Result(property = "memo", column = "memo"),
        @Result(property = "writer", column = "writer"),
        @Result(property = "post_date", column = "post_date")
      })*/
	@Select(list)
	public List<UserMemoVO> list(Map map);

	//or @Select(list)
	@Select(list)
	public List<UserMemoVO> list2(@Param("userid") String usrid, 
			@Param("start") Integer start, @Param("end") Integer end);
	
	@Select(getMemo)
	public UserMemoVO getMemo(Integer idx);


	@Insert(insertMemo)
	public void insertMemo(UserMemoVO vo);

	
	@Update( memoUpdate )
	public void memoUpdate(UserMemoVO vo);

	
	@Delete (memoDelete)
	public void memoDelete(Integer idx);

	@Select(countMemo )
	public int countMemo(String userid);
	 
	
}
