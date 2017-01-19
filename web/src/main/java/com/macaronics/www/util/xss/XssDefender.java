package com.macaronics.www.util.xss;

public class XssDefender {

	
	public static String  inputString(String input){
		String str =input.replaceAll("<", "&lt;")
				.replaceAll(">", "&gt;")
				.replaceAll("  ", "&nbsp;&nbsp;")
				.replaceAll("\n", "<br>");
		return  str;
	}
	
	
	public static String removeTag(String html) throws Exception {
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
}
