package com.macaronics.www.user.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class GalleryDTO {

	private Integer idx;
	private String fileName;
	private String fileTypes;
	private String filePath;
	private long fileSize;
	private Date createDate;
	private Date updateDate;
	
}
