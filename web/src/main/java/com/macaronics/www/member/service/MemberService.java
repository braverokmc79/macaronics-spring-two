package com.macaronics.www.member.service;

import java.util.List;

import com.macaronics.www.member.model.dto.MemberDTO;

public interface MemberService {


	public List<MemberDTO> memberList();
	public void insertMember(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public void deleteMember(String userid);
	public void updateMember(MemberDTO dto);
	public boolean userAndEmailConfirm(MemberDTO memberdto);
	public String checkPwd(String userid);
	
	
	
}
