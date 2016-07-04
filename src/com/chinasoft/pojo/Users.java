package com.chinasoft.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields
	private Integer UId;
	private String UAccount;
	private String UPwd;
	private String UName;
	private String UGender;
	private String UHeader;
	private Integer UCredit;
	private String UTele;
	private String UEmail;
	private Set collects = new HashSet(0);
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Users() {
		//不能设置属性值，如UCredit=1，否则查询不到在数据库中字段不为这里设置值的记录，如某一用户UCredit=3，则找不到
	}

	/** minimal constructor */
	public Users(String UAccount, String UPwd, String UName, Integer UCredit) {
		this.UAccount = UAccount;
		this.UPwd = UPwd;
		this.UName = UName;
		this.UCredit = UCredit;
	}

	/** full constructor */
	public Users(String UAccount, String UPwd, String UName, String UGender,
			String UHeader, Integer UCredit, String UTele, String UEmail,
			Set collects, Set comments) {
		this.UAccount = UAccount;
		this.UPwd = UPwd;
		this.UName = UName;
		this.UGender = UGender;
		this.UHeader = UHeader;
		this.UCredit = UCredit;
		this.UTele = UTele;
		this.UEmail = UEmail;
		this.collects = collects;
		this.comments = comments;
	}

	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUAccount() {
		return this.UAccount;
	}

	public void setUAccount(String UAccount) {
		this.UAccount = UAccount;
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

	public String getUGender() {
		return this.UGender;
	}

	public void setUGender(String UGender) {
		this.UGender = UGender;
	}

	public String getUHeader() {
		return this.UHeader;
	}

	public void setUHeader(String UHeader) {
		this.UHeader = UHeader;
	}

	public Integer getUCredit() {
		return this.UCredit;
	}

	public void setUCredit(Integer UCredit) {
		this.UCredit = UCredit;
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

	public Set getCollects() {
		return this.collects;
	}

	public void setCollects(Set collects) {
		this.collects = collects;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}