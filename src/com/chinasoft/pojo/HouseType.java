package com.chinasoft.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * HouseType entity. @author MyEclipse Persistence Tools
 */

public class HouseType implements java.io.Serializable {

	// Fields

	private Integer htypeId;
	private String htypeName;
	private String remark;
	private Set houseSellRents = new HashSet(0);
	private Set houseSellSecondhands = new HashSet(0);
	private Set houseBuyRents = new HashSet(0);
	private Set houseBuyRequests = new HashSet(0);
	private Set houseSellEnterprises = new HashSet(0);

	// Constructors

	/** default constructor */
	public HouseType() {
	}

	/** minimal constructor */
	public HouseType(String htypeName) {
		this.htypeName = htypeName;
	}

	/** full constructor */
	public HouseType(String htypeName, String remark, Set houseSellRents,
			Set houseSellSecondhands, Set houseBuyRents, Set houseBuyRequests,
			Set houseSellEnterprises) {
		this.htypeName = htypeName;
		this.remark = remark;
		this.houseSellRents = houseSellRents;
		this.houseSellSecondhands = houseSellSecondhands;
		this.houseBuyRents = houseBuyRents;
		this.houseBuyRequests = houseBuyRequests;
		this.houseSellEnterprises = houseSellEnterprises;
	}

	// Property accessors

	public Integer getHtypeId() {
		return this.htypeId;
	}

	public void setHtypeId(Integer htypeId) {
		this.htypeId = htypeId;
	}

	public String getHtypeName() {
		return this.htypeName;
	}

	public void setHtypeName(String htypeName) {
		this.htypeName = htypeName;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set getHouseSellRents() {
		return this.houseSellRents;
	}

	public void setHouseSellRents(Set houseSellRents) {
		this.houseSellRents = houseSellRents;
	}

	public Set getHouseSellSecondhands() {
		return this.houseSellSecondhands;
	}

	public void setHouseSellSecondhands(Set houseSellSecondhands) {
		this.houseSellSecondhands = houseSellSecondhands;
	}

	public Set getHouseBuyRents() {
		return this.houseBuyRents;
	}

	public void setHouseBuyRents(Set houseBuyRents) {
		this.houseBuyRents = houseBuyRents;
	}

	public Set getHouseBuyRequests() {
		return this.houseBuyRequests;
	}

	public void setHouseBuyRequests(Set houseBuyRequests) {
		this.houseBuyRequests = houseBuyRequests;
	}

	public Set getHouseSellEnterprises() {
		return this.houseSellEnterprises;
	}

	public void setHouseSellEnterprises(Set houseSellEnterprises) {
		this.houseSellEnterprises = houseSellEnterprises;
	}

}