package com.macaronics.www.admin;

import java.sql.Date;

public class TblAdmin {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private Date regdate;
	private Date updatedate;
	private double memberLevel;

	public TblAdmin() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}

	/**
	 * @param value the userid to set
	 */
	public TblAdmin setUserid(final String value) {
		userid = value;
		return this;
	}

	/**
	 * @return the userpw
	 */
	public String getUserpw() {
		return userpw;
	}

	/**
	 * @param value the userpw to set
	 */
	public TblAdmin setUserpw(final String value) {
		userpw = value;
		return this;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param value the username to set
	 */
	public TblAdmin setUsername(final String value) {
		username = value;
		return this;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param value the email to set
	 */
	public TblAdmin setEmail(final String value) {
		email = value;
		return this;
	}

	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}

	/**
	 * @param value the regdate to set
	 */
	public TblAdmin setRegdate(final Date value) {
		regdate = value;
		return this;
	}

	/**
	 * @return the updatedate
	 */
	public Date getUpdatedate() {
		return updatedate;
	}

	/**
	 * @param value the updatedate to set
	 */
	public TblAdmin setUpdatedate(final Date value) {
		updatedate = value;
		return this;
	}

	/**
	 * @return the memberLevel
	 */
	public double getMemberLevel() {
		return memberLevel;
	}

	/**
	 * @param value the memberLevel to set
	 */
	public TblAdmin setMemberLevel(final double value) {
		memberLevel = value;
		return this;
	}

}
