package com.macaronics.www.member.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.macaronics.www.member.model.dao.board.FreeBoadReplyDAO;
import com.macaronics.www.member.model.dto.MemberDTO;
import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;


@Service
public class FreeBoadReplyServiceImpl implements FreeBoadReplyService {

	
	private static final Logger logger=LoggerFactory.getLogger(FreeBoadReplyServiceImpl.class);
	
	@Inject
	private FreeBoadReplyDAO  freeBoardReplyao;
	
	@Override
	public List<FreeBoardReplyVO> list(Integer bno) {
		// TODO Auto-generated method stub
		return freeBoardReplyao.list(bno);
	}

	@Override
	public void create(FreeBoardReplyVO vo) {
	
		freeBoardReplyao.create(vo);
	}

	@Override
	public void update(FreeBoardReplyVO vo) {

		freeBoardReplyao.update(vo);
	}

	@Override
	public void delete(Integer rno) {
		// TODO Auto-generated method stub
		freeBoardReplyao.delete(rno);
	}

	@Override
	public int countOracleReply(Integer bno) {
		// TODO Auto-generated method stub
		return freeBoardReplyao.countOracleReply(bno);
	}

	@Override
	public List<FreeBoardReplyVO> oracleList(Integer bno, int start, int end, HttpSession session) {

		 List<FreeBoardReplyVO>  list=freeBoardReplyao.oracleList(bno, start, end);
		
		 for(FreeBoardReplyVO row : list){
			 
			 //로그인 여부
			MemberDTO  dto =(MemberDTO) session.getAttribute("loginUser");
			 if(dto!=null){
				 
				 if(row.getSecret_reply().equals("y")){
				
					 if(dto.getUserid().equals(row.getReplyer())
						|| dto.getUserid().equals(row.getWriter())
							 ){
						 //로그인 한 유저 와 댓글 한 유저 또는 글쓴 유저 아이디가 같으면 통과
					 }else{
						 
						 row.setReplytext("비밀 댓글 입니다.");
					 }
				 }
			 }else{
				 //로그인 안한 사람 비밀 댓글이 y 면 비빌댓글입니다. 표시
				if(row.getSecret_reply().equals("y")){
					row.setReplytext("비밀 댓글 입니다.");
				}
				 
			 }
		 }	 
		return list;
	}

	
	
	@Override
	public FreeBoardReplyVO detail(int rno) {
		// TODO Auto-generated method stub
		return freeBoardReplyao.detail(rno);
	}

	
	
	
	@Override
	public void replyAlter(FreeBoardReplyVO vo) {
		
		freeBoardReplyao.replyAlter(vo);
	}

	@Override
	public void replyDelete(Integer rno) {
		// TODO Auto-generated method stub
		
		freeBoardReplyao.replyDelete(rno);
	}

	
	
}





