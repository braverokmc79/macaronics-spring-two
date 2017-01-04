package com.macaronics.www.util.xss;

public class XssDefender {

	
	public static String  inputString(String input){
		String str =input.replaceAll("<", "&lt;")
				.replaceAll(">", "&gt;")
				.replaceAll("  ", "&nbsp;&nbsp;")
				.replaceAll("\n", "<br>");
		return  str;
	}
	
	
}
