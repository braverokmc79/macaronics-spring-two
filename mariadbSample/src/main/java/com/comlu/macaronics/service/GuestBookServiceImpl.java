package com.comlu.macaronics.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.comlu.macaronics.dto.GuestBookDTO;
import com.comlu.macaronics.mapper.GuestBookDAO;


@Service
public class GuestBookServiceImpl implements GuestBookService {

	//@Inject
	private GuestBookDAO guestbookDao;
	
	@Override
	public List<GuestBookDTO> list() {
		
		return guestbookDao.list();
	}

	
	
}
