package com.comlu.macaronics.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.comlu.macaronics.dto.GuestBookDTO;
import com.comlu.macaronics.dto.TblMember;
import com.comlu.macaronics.dto.TblUser;

public interface GuestBookDAO {
	
	
	String list ="select * from tbl_board where bno >0  order by bno desc";
	
	String list2 =" select * from TBL_USER ";
	
	String list3 =" select * from tbl_member  ";
	
	@Select(list)
	public List<GuestBookDTO> list();
	
	
	//@Select(list2)
	public List<TblUser> list2();
	
	@Select(list3)
	public List<TblMember> list3();
	
}
