package com.chinasoft.pojo;

/**
 * Transactions entity. @author MyEclipse Persistence Tools
 */

public class Transactions implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer usellId;
	private Integer ubuyId;
	private Integer transType;
	private Integer HId;
	private String transDate;

	// Constructors

	/** default constructor */
	public Transactions() {
	}

	/** full constructor */
	public Transactions(Integer usellId, Integer ubuyId, Integer transType,
			Integer HId, String transDate) {
		this.usellId = usellId;
		this.ubuyId = ubuyId;
		this.transType = transType;
		this.HId = HId;
		this.transDate = transDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUsellId() {
		return this.usellId;
	}

	public void setUsellId(Integer usellId) {
		this.usellId = usellId;
	}

	public Integer getUbuyId() {
		return this.ubuyId;
	}

	public void setUbuyId(Integer ubuyId) {
		this.ubuyId = ubuyId;
	}

	public Integer getTransType() {
		return this.transType;
	}

	public void setTransType(Integer transType) {
		this.transType = transType;
	}

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	public String getTransDate() {
		return this.transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

}