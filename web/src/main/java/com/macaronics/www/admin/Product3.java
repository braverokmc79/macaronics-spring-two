package com.macaronics.www.admin;

import java.math.BigDecimal;
import java.sql.Clob;
import java.sql.Date;

public class Product3 {

	private double productId;
	private String productName;
	private double price;
	private String description;
	private String pictureUrl;
	private Date regdate;
	private double amount;
	private String productState;
	private Clob bigDescription;
	private double categoryIdx;
	private double categoryBno;
	private double categoryRno;
	private double deliver;
	private BigDecimal deliverMoney;
	private Date updatedate;
	private double viewCount;

	public Product3() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the productId
	 */
	public double getProductId() {
		return productId;
	}

	/**
	 * @param value the productId to set
	 */
	public Product3 setProductId(final double value) {
		productId = value;
		return this;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param value the productName to set
	 */
	public Product3 setProductName(final String value) {
		productName = value;
		return this;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param value the price to set
	 */
	public Product3 setPrice(final double value) {
		price = value;
		return this;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param value the description to set
	 */
	public Product3 setDescription(final String value) {
		description = value;
		return this;
	}

	/**
	 * @return the pictureUrl
	 */
	public String getPictureUrl() {
		return pictureUrl;
	}

	/**
	 * @param value the pictureUrl to set
	 */
	public Product3 setPictureUrl(final String value) {
		pictureUrl = value;
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
	public Product3 setRegdate(final Date value) {
		regdate = value;
		return this;
	}

	/**
	 * @return the amount
	 */
	public double getAmount() {
		return amount;
	}

	/**
	 * @param value the amount to set
	 */
	public Product3 setAmount(final double value) {
		amount = value;
		return this;
	}

	/**
	 * @return the productState
	 */
	public String getProductState() {
		return productState;
	}

	/**
	 * @param value the productState to set
	 */
	public Product3 setProductState(final String value) {
		productState = value;
		return this;
	}

	/**
	 * @return the bigDescription
	 */
	public Clob getBigDescription() {
		return bigDescription;
	}

	/**
	 * @param value the bigDescription to set
	 */
	public Product3 setBigDescription(final Clob value) {
		bigDescription = value;
		return this;
	}

	/**
	 * @return the categoryIdx
	 */
	public double getCategoryIdx() {
		return categoryIdx;
	}

	/**
	 * @param value the categoryIdx to set
	 */
	public Product3 setCategoryIdx(final double value) {
		categoryIdx = value;
		return this;
	}

	/**
	 * @return the categoryBno
	 */
	public double getCategoryBno() {
		return categoryBno;
	}

	/**
	 * @param value the categoryBno to set
	 */
	public Product3 setCategoryBno(final double value) {
		categoryBno = value;
		return this;
	}

	/**
	 * @return the categoryRno
	 */
	public double getCategoryRno() {
		return categoryRno;
	}

	/**
	 * @param value the categoryRno to set
	 */
	public Product3 setCategoryRno(final double value) {
		categoryRno = value;
		return this;
	}

	/**
	 * @return the deliver
	 */
	public double getDeliver() {
		return deliver;
	}

	/**
	 * @param value the deliver to set
	 */
	public Product3 setDeliver(final double value) {
		deliver = value;
		return this;
	}

	/**
	 * @return the deliverMoney
	 */
	public BigDecimal getDeliverMoney() {
		return deliverMoney;
	}

	/**
	 * @param value the deliverMoney to set
	 */
	public Product3 setDeliverMoney(final BigDecimal value) {
		deliverMoney = value;
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
	public Product3 setUpdatedate(final Date value) {
		updatedate = value;
		return this;
	}

	/**
	 * @return the viewCount
	 */
	public double getViewCount() {
		return viewCount;
	}

	/**
	 * @param value the viewCount to set
	 */
	public Product3 setViewCount(final double value) {
		viewCount = value;
		return this;
	}

}
