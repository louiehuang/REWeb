package com.chinasoft.pojo;

/**
 * Administrator entity. @author MyEclipse Persistence Tools
 */

public class Administrator implements java.io.Serializable {

	// Fields

	private String account;
	private String pwd;
	private String name;
	private String tele;
	private String email;

	// Constructors

	/** default constructor */
	public Administrator() {
	}

	/** minimal constructor */
	public Administrator(String pwd, String name) {
		this.pwd = pwd;
		this.name = name;
	}

	/** full constructor */
	public Administrator(String pwd, String name, String tele, String email) {
		this.pwd = pwd;
		this.name = name;
		this.tele = tele;
		this.email = email;
	}

	// Property accessors

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTele() {
		return this.tele;
	}

	public void setTele(String tele) {
		this.tele = tele;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}