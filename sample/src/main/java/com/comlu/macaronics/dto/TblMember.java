package com.comlu.macaronics.dto;

import java.sql.Timestamp;

public class TblMember {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int memberLevel;

	public TblMember() {
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
	public TblMember setUserid(final String value) {
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
	public TblMember setUserpw(final String value) {
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
	public TblMember setUsername(final String value) {
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
	public TblMember setEmail(final String value) {
		email = value;
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
	public TblMember setRegdate(final Timestamp value) {
		regdate = value;
		return this;
	}

	/**
	 * @return the updatedate
	 */
	public Timestamp getUpdatedate() {
		return updatedate;
	}

	/**
	 * @param value the updatedate to set
	 */
	public TblMember setUpdatedate(final Timestamp value) {
		updatedate = value;
		return this;
	}

	/**
	 * @return the memberLevel
	 */
	public int getMemberLevel() {
		return memberLevel;
	}

	/**
	 * @param value the memberLevel to set
	 */
	public TblMember setMemberLevel(final int value) {
		memberLevel = value;
		return this;
	}

	@Override
	public String toString() {
		return "TblMember [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", memberLevel=" + memberLevel + "]";
	}

	
	
}
