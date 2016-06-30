package com.chinasoft.pojo;

/**
 * Colletion entity. @author MyEclipse Persistence Tools
 */

public class Colletion implements java.io.Serializable {

	// Fields

	private Integer id;
	private Users users;
	private Integer HId;
	private Integer CType;

	// Constructors

	/** default constructor */
	public Colletion() {
	}

	/** full constructor */
	public Colletion(Users users, Integer HId, Integer CType) {
		this.users = users;
		this.HId = HId;
		this.CType = CType;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	public Integer getCType() {
		return this.CType;
	}

	public void setCType(Integer CType) {
		this.CType = CType;
	}

}