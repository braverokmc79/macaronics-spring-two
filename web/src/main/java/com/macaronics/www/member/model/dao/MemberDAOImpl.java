package com.macaronics.www.member.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.macaronics.www.SqlServerEnvironment;
import com.macaronics.www.member.model.dto.MemberDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger =LoggerFactory.getLogger(MemberDAOImpl.class);
	
	private static String namespace= SqlServerEnvironment.SQL+"memberMapper";
	
	
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



	@Override
	public boolean userAndEmailConfirm(MemberDTO memberdto) {
		
		boolean result =false;
		logger.info("userAndEmailConfirm  : " + memberdto.toString());
		int count= sqlSession.selectOne(namespace+".userAndEmailConfirm", memberdto);
		
		if(count ==0){
			result =true;
		}
			
		return result;
	}



	@Override
	public String checkPwd(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".checkPwd", userid);
	}

	
	
	
}
