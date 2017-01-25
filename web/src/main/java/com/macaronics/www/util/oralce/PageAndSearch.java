package com.macaronics.www.util.oralce;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;



public class PageAndSearch extends Pager {

	private String search_option;
	private String keyword;
	private String sortby;
	private Integer show;

	
	private Integer start;
	private Integer end;
	
	
	public  String searchQuery(Integer curPage){
		if(curPage==null){
			curPage=1;
		}
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("curPage", curPage )
				.queryParam("search_option", getSearch_option())
				.queryParam("sortby", getSortby())
				.queryParam("show", getShow())
				.queryParam("keyword", getKeyword())
				.build();
		
		return uriComponents.toUriString(); 
	}


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

	

	public String getSortby() {
		return sortby;
	}


	public void setSortby(String sortby) {
		this.sortby = sortby;
	}





	public Integer getShow() {
		return show;
	}


	public void setShow(Integer show) {
		this.show = show;
	}


	
	
	
	
	
	public Integer getStart() {
		return start;
	}


	public void setStart(Integer start) {
		this.start = start;
	}


	public Integer getEnd() {
		return end;
	}


	public void setEnd(Integer end) {
		this.end = end;
	}


	@Override
	public String toString() {
		return "PageAndSearch [search_option=" + search_option + ", keyword=" + keyword + ", sortby=" + sortby
				+ ", show=" + show + "]";
	}



	
	
	

}
