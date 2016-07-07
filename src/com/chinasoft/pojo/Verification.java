package com.chinasoft.pojo;

/**
 * Verification entity. @author MyEclipse Persistence Tools
 */

public class Verification implements java.io.Serializable {

	// Fields

	private Integer id;
	private Region region;
	private Users users;
	private Integer HId;
	private Integer htype;
	private String content;
	private String vdate;
	private String pdate;
	private Integer vstatus;
	private Integer vres;

	// Constructors

	/** default constructor */
	public Verification() {
	}

	/** minimal constructor */
	public Verification(Region region) {
		this.region = region;
	}

	/** full constructor */
	public Verification(Region region, Users users, Integer HId, Integer htype,
			String content, String vdate, String pdate, Integer vstatus,
			Integer vres) {
		this.region = region;
		this.users = users;
		this.HId = HId;
		this.htype = htype;
		this.content = content;
		this.vdate = vdate;
		this.pdate = pdate;
		this.vstatus = vstatus;
		this.vres = vres;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Region getRegion() {
		return this.region;
	}

	public void setRegion(Region region) {
		this.region = region;
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

	public Integer getHtype() {
		return this.htype;
	}

	public void setHtype(Integer htype) {
		this.htype = htype;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVdate() {
		return this.vdate;
	}

	public void setVdate(String vdate) {
		this.vdate = vdate;
	}

	public String getPdate() {
		return this.pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public Integer getVstatus() {
		return this.vstatus;
	}

	public void setVstatus(Integer vstatus) {
		this.vstatus = vstatus;
	}

	public Integer getVres() {
		return this.vres;
	}

	public void setVres(Integer vres) {
		this.vres = vres;
	}

}