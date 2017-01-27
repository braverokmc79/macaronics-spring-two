package com.comlu.macaronics.utility;

import java.io.StringReader;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class CLOBHandler implements TypeHandler {

	//Statement 로 호출해서 ResultSet 의 컬럼이름을 읽어올 때
	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		
		return rs.getString(columnName);
	}

	//Statement 로 호출해서 ResultSet 의 컬럼인덱스로 읽어올 때
	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		return rs.getString(columnIndex);
	}
	
	
	//CallableStatement로 호출해서 ResultSet 의 컬럼인덱스로 읽어올 때 
	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return cs.getString(columnIndex);
	}

	//Statement의 파라미터를 세팅할 때
	@Override
	public void setParameter(PreparedStatement ps, int columnIndex, Object parameter, 
			JdbcType arg3) throws SQLException {
	
		String s=(String)parameter;
		StringReader reader=new StringReader(s);
		ps.setCharacterStream(columnIndex, reader, s.length());
		
	}
	
	

}
