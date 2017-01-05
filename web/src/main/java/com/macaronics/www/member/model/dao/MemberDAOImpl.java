package com.macaronics.www.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	private final String MYSQL_PASSWORD_KEY ="macaronics119@";
	
	private static String namespace= SqlServerEnvironment.SQL+"memberMapper";
	
	
	private static final Logger logger =LoggerFactory.getLogger(MemberDAOImpl.class);
	
	
	
	
	@Override
	public List<MemberDTO> memberList() {
		
		return sqlSession.selectList(namespace+".memberList");
	}

	
	
	@Override
	public void insertMember(MemberDTO dto) {
	
		if(SqlServerEnvironment.SQL.equals("MYSQL")){

			dto.setPassword_key(MYSQL_PASSWORD_KEY);		
			sqlSession.insert(namespace+".insertMember", dto);
		
		}else{	
			sqlSession.insert(namespace+".insertMember", dto);	
		}
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
		
		if(SqlServerEnvironment.SQL.equals("MYSQL")){
			
			 Map<String, Object> map =new HashMap<>();
			 map.put("userid", userid);
			 map.put("password_key", MYSQL_PASSWORD_KEY);
				
			return sqlSession.selectOne(namespace+".checkPwd", map);
		}else{
			
			return sqlSession.selectOne(namespace+".checkPwd", userid);
		}
	}



	@Override
	public MemberDTO checkLogin(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		//MY - SQL DB와 오라클 DB  분리  
		if(SqlServerEnvironment.SQL.equals("MYSQL")){
			
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("email", dto.getEmail());
			map.put("password_key", MYSQL_PASSWORD_KEY);
				
			return  sqlSession.selectOne(namespace+".checkLogin", map);
			
		}else {
			
			return sqlSession.selectOne(namespace+".checkLogin", dto);
		}
		
	}

	
	
	
	
	
}
