package com.macaronics.www.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/calendar")
public class AdminCalendarController {

	
	private final String JSP_PAGE ="/admin/calendar/";
	
	@RequestMapping("/index")
	public String calendarIndex(){
		
		return JSP_PAGE+"calendarIndex";
				
	}
	
	
}
