package com.macaronics.www.member.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.member.model.dto.MemberDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger =LoggerFactory.getLogger(MemberDAOImpl.class);
	
	private static String namespace="memberMapper";
	
	
	@Override
	public List<MemberDTO> memberList() {
		
		return sqlSession.selectList(namespace+".memberList");
	}

	
	
	@Override
	public void insertMember(MemberDTO dto) {
		
		sqlSession.insert(namespace+".insertMember", dto);
	}

	@Override
	public MemberDTO viewMember(String userid) {
		
		return  sqlSession.selectOne(namespace+".viewMember", userid);
	}

	@Override
	public void deleteMember(String userid) {
		
		sqlSession.delete(namespace+".deleteMember", userid);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update(namespace+".updateMember", dto);
	}

	
	
	
}
