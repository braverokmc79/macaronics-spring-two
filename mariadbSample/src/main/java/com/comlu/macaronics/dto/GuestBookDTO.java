package com.comlu.macaronics.dto;

import java.sql.Timestamp;

public class GuestBookDTO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regdate;
	private int viewcnt;

	public GuestBookDTO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the bno
	 */
	public int getBno() {
		return bno;
	}

	/**
	 * @param value the bno to set
	 */
	public GuestBookDTO setBno(final int value) {
		bno = value;
		return this;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param value the title to set
	 */
	public GuestBookDTO setTitle(final String value) {
		title = value;
		return this;
	}

	public String getWriter() {
		return writer;
	}

	/**
	 * @param value the writer to set
	 */
	public GuestBookDTO setWriter(final String value) {
		writer = value;
		return this;
	}

	/**
	 * @return the regdate
	 */
	public Timestamp getRegdate() {
		return regdate;
	}

	/**
	 * @param value the regdate to set
	 */
	public GuestBookDTO setRegdate(final Timestamp value) {
		regdate = value;
		return this;
	}

	/**
	 * @return the viewcnt
	 */
	public int getViewcnt() {
		return viewcnt;
	}

	/**
	 * @param value the viewcnt to set
	 */
	public GuestBookDTO setViewcnt(final int value) {
		viewcnt = value;
		return this;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "GuestBookDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}

	
	
	
	
}
