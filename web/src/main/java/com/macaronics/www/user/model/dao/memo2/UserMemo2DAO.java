package com.macaronics.www.user.model.dao.memo2;

import java.util.List;

public interface UserMemo2DAO {
	public List<UserMemoVO> list();

	public List<UserMemoVO> list(Integer start, Integer end, String userid);
}
