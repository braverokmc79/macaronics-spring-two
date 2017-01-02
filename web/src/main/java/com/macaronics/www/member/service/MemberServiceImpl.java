package com.macaronics.www.member.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.member.model.dao.MemberDAO;
import com.macaronics.www.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDao;
	
	private static final Logger logger =LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	
	@Override
	public List<MemberDTO> memberList() {
		return memberDao.memberList();
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}

	@Override
	public MemberDTO viewMember(String userid) {
		
		return memberDao.viewMember(userid);
	}

	@Override
	public void deleteMember(String userid) {
		
		memberDao.deleteMember(userid);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		memberDao.updateMember(dto);
	}

	@Override
	public boolean userAndEmailConfirm(MemberDTO memberdto) {
		// TODO Auto-generated method stub
		return memberDao.userAndEmailConfirm(memberdto);
	}

}
