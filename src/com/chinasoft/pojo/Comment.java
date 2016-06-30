package com.chinasoft.pojo;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Users users;
	private Integer HId;
	private Integer CType;
	private String comment;
	private String cdate;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(Users users, Integer HId, Integer CType, String comment) {
		this.users = users;
		this.HId = HId;
		this.CType = CType;
		this.comment = comment;
	}

	/** full constructor */
	public Comment(Users users, Integer HId, Integer CType, String comment,
			String cdate) {
		this.users = users;
		this.HId = HId;
		this.CType = CType;
		this.comment = comment;
		this.cdate = cdate;
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

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCdate() {
		return this.cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

}