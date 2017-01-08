package com.macaronics.www.util.mysql;

public class Criteria {

	private Integer page;
	private Integer perPageNum;
	
	
	
	public Criteria(){
		this.page=1;
		this.perPageNum=10;
	}
	
	public void setPage(int page){
		if(page <=0){
			this.page =1;
			return ;
		}
		this.page =page;
	}
	

	public void setPerPageNum(int perPageNum){
		if(perPageNum <=10 || perPageNum >100){
			this.perPageNum=10;
			return ;
		}
		this.perPageNum =perPageNum;
	}
	
	public Integer getPage() {
		return page;
	}
	
	public Integer getPerPageNum() {
		return perPageNum;
	}
	
	
	public Integer getPageStart(){
		
		return (this.page-1) * perPageNum;
	}

	

	
	
	
	
	
	
}
