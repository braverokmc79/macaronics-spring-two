package com.comlu.macaronics.dto;

import java.util.Date;

public class FacebookFeedVO {

	private Integer idx;
	private String id;
	private String name;
	private String message;
	private String picture;
	private Date created_time;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	
	
	
	
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	
	
	@Override
	public String toString() {
		return "FacebookFeedVO [idx=" + idx + ", id=" + id + ", name=" + name + ", message=" + message + ", picture="
				+ picture + ", created_time=" + created_time + "]";
	}

	
	
	

}
