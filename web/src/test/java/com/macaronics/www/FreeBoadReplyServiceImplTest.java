package com.macaronics.www;

import static org.junit.Assert.fail;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.macaronics.www.member.model.dto.board.FreeBoardReplyVO;
import com.macaronics.www.member.service.board.FreeBoadReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class FreeBoadReplyServiceImplTest {

	@Inject
	FreeBoadReplyService service;
	
	@Test
	public void testList() {
		service.list(100);
	}

	@Test
	public void testCreate() {
		FreeBoardReplyVO vo =new FreeBoardReplyVO();
		vo.setBno(1000);
		vo.setReplytext("test");
		vo.setReplyer("que");
		vo.setRno(3);
		service.update(vo);
	}

	@Test
	public void testUpdate() {
		FreeBoardReplyVO vo =new FreeBoardReplyVO();
		vo.setBno(1000);
		vo.setReplytext("test");
		vo.setReplyer("que");
		service.create(vo);
	}

	@Test
	public void testDelete() {
		
		service.delete(2);
	}

}
