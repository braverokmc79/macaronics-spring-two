package com.macaronics.www.util.mysql;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum =10;
	private Criteria cri;
	
	private int endFinishPage;
	
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	
	private void calcData(){
		endPage =(int)(Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
		startPage =(endPage -displayPageNum) +1;
		
		endFinishPage =(int)(Math.ceil(totalCount)/(double)cri.getPerPageNum());
	
		if(endPage >endFinishPage){
			endPage =endFinishPage;
		}
	
		prev =startPage ==1 ? false :true;
		next =endPage * cri.getPerPageNum() >= totalCount ? false :true;
	}
	
	
	
	public String mysqlSearchQuery(int page){
		
		UriComponents  uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("search_option", ((SearchCriteria)cri).getSearch_option() )
				.queryParam("keyword", ((SearchCriteria)cri).getKeyword() )
				.build();
		
		return uriComponents.toUriString();
	}
	
	

}






