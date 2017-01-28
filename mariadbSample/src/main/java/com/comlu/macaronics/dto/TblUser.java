package com.comlu.macaronics.dto;

public class TblUser {

	private String userid;
	private String upw;
	private String uname;
	private double upoint;

	public TblUser() {
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
	public TblUser setUserid(final String value) {
		userid = value;
		return this;
	}

	/**
	 * @return the upw
	 */
	public String getUpw() {
		return upw;
	}

	/**
	 * @param value the upw to set
	 */
	public TblUser setUpw(final String value) {
		upw = value;
		return this;
	}

	/**
	 * @return the uname
	 */
	public String getUname() {
		return uname;
	}

	/**
	 * @param value the uname to set
	 */
	public TblUser setUname(final String value) {
		uname = value;
		return this;
	}

	/**
	 * @return the upoint
	 */
	public double getUpoint() {
		return upoint;
	}

	/**
	 * @param value the upoint to set
	 */
	public TblUser setUpoint(final double value) {
		upoint = value;
		return this;
	}

	@Override
	public String toString() {
		return "TblUser [userid=" + userid + ", upw=" + upw + ", uname=" + uname + ", upoint=" + upoint + "]";
	}
	
	

}
