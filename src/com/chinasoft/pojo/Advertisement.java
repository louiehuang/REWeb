package com.chinasoft.pojo;

/**
 * Advertisement entity. @author MyEclipse Persistence Tools
 */

public class Advertisement implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer UId;
	private Integer UType;
	private String adContent;
	private Integer adCost;
	private String startDate;
	private String endDate;

	// Constructors

	/** default constructor */
	public Advertisement() {
	}

	/** minimal constructor */
	public Advertisement(String adContent) {
		this.adContent = adContent;
	}

	/** full constructor */
	public Advertisement(Integer UId, Integer UType, String adContent,
			Integer adCost, String startDate, String endDate) {
		this.UId = UId;
		this.UType = UType;
		this.adContent = adContent;
		this.adCost = adCost;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public Integer getUType() {
		return this.UType;
	}

	public void setUType(Integer UType) {
		this.UType = UType;
	}

	public String getAdContent() {
		return this.adContent;
	}

	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}

	public Integer getAdCost() {
		return this.adCost;
	}

	public void setAdCost(Integer adCost) {
		this.adCost = adCost;
	}

	public String getStartDate() {
		return this.startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return this.endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}