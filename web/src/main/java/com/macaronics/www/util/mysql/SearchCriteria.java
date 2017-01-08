package com.macaronics.www.util.mysql;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;


public class SearchCriteria extends Criteria {

	private String search_option;
	private String keyword;
	
		
	public String getSearch_option() {
		return search_option;
	}
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	@Override
	public String toString() {
		return "SearchCriteria [search_option=" + search_option + ", keyword=" + keyword + "]";
	}
	
	public String mysqlSearchQuery(int page){
		
		UriComponents  uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				
				.queryParam("search_option",search_option )
				.queryParam("keyword", keyword )
				.build();
		
		return uriComponents.toUriString();
	}

	
}
