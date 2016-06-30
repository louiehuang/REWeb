package com.chinasoft.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * EnterpriseUsers entity. @author MyEclipse Persistence Tools
 */

public class EnterpriseUsers implements java.io.Serializable {

	// Fields

	private Integer UId;
	private String UPwd;
	private String UName;
	private String UInfo;
	private String UAddr;
	private Integer UValidation;
	private String UTele;
	private String UEmail;
	private Set houseSellEnterprises = new HashSet(0);

	// Constructors

	/** default constructor */
	public EnterpriseUsers() {
	}

	/** minimal constructor */
	public EnterpriseUsers(String UPwd, String UName) {
		this.UPwd = UPwd;
		this.UName = UName;
	}

	/** full constructor */
	public EnterpriseUsers(String UPwd, String UName, String UInfo,
			String UAddr, Integer UValidation, String UTele, String UEmail,
			Set houseSellEnterprises) {
		this.UPwd = UPwd;
		this.UName = UName;
		this.UInfo = UInfo;
		this.UAddr = UAddr;
		this.UValidation = UValidation;
		this.UTele = UTele;
		this.UEmail = UEmail;
		this.houseSellEnterprises = houseSellEnterprises;
	}

	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUPwd() {
		return this.UPwd;
	}

	public void setUPwd(String UPwd) {
		this.UPwd = UPwd;
	}

	public String getUName() {
		return this.UName;
	}

	public void setUName(String UName) {
		this.UName = UName;
	}

	public String getUInfo() {
		return this.UInfo;
	}

	public void setUInfo(String UInfo) {
		this.UInfo = UInfo;
	}

	public String getUAddr() {
		return this.UAddr;
	}

	public void setUAddr(String UAddr) {
		this.UAddr = UAddr;
	}

	public Integer getUValidation() {
		return this.UValidation;
	}

	public void setUValidation(Integer UValidation) {
		this.UValidation = UValidation;
	}

	public String getUTele() {
		return this.UTele;
	}

	public void setUTele(String UTele) {
		this.UTele = UTele;
	}

	public String getUEmail() {
		return this.UEmail;
	}

	public void setUEmail(String UEmail) {
		this.UEmail = UEmail;
	}

	public Set getHouseSellEnterprises() {
		return this.houseSellEnterprises;
	}

	public void setHouseSellEnterprises(Set houseSellEnterprises) {
		this.houseSellEnterprises = houseSellEnterprises;
	}

}