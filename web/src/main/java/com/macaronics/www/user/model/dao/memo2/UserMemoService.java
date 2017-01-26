package com.macaronics.www.user.model.dao.memo2;
         
import java.util.List;

import com.macaronics.www.util.oralce.PageAndSearch;

       
public interface UserMemoService {

	
	public List<UserMemoVO> list(String userid, PageAndSearch pas);

	public UserMemoVO getMemo(Integer idx);

	public void insertMemo(UserMemoVO vo) throws Exception;

	public void memoUpdate(UserMemoVO vo) throws Exception;

	public void memoDelete(Integer idx);

	public int countMemo(String userid);
	 
	
}
