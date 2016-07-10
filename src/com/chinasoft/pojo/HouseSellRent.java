package com.chinasoft.pojo;

/**
 * HouseSellRent entity. @author MyEclipse Persistence Tools
 */

public class HouseSellRent implements java.io.Serializable {

	// Fields

	private Integer HId;
	private Region region;
	private HouseType houseType;
	private Integer UId;
	private String title;
	private String pics;
	private Double price;
	private Double size;
	private Integer houseFloor;
	private Integer decoration;
	private Integer orientation;
	private String community;
	private String remark;
	private Integer havailability;
	private Integer hauthenticity;
    private String address;
    
	// Constructors

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	/** default constructor */
	public HouseSellRent() {
	}

	/** minimal constructor */
	public HouseSellRent(Region region, HouseType houseType, Integer UId,
			Double price, Double size, Integer houseFloor,
			Integer havailability, Integer hauthenticity) {
		this.region = region;
		this.houseType = houseType;
		this.UId = UId;
		this.price = price;
		this.size = size;
		this.houseFloor = houseFloor;
		this.havailability = havailability;
		this.hauthenticity = hauthenticity;
	}

	/** full constructor */
	public HouseSellRent(Region region, HouseType houseType, Integer UId,
			String title, String pics, Double price, Double size,
			Integer houseFloor, Integer decoration, Integer orientation,
			String community, String remark, Integer havailability,
			Integer hauthenticity,String address) {
		this.region = region;
		this.houseType = houseType;
		this.UId = UId;
		this.title = title;
		this.pics = pics;
		this.price = price;
		this.size = size;
		this.houseFloor = houseFloor;
		this.decoration = decoration;
		this.orientation = orientation;
		this.community = community;
		this.remark = remark;
		this.havailability = havailability;
		this.hauthenticity = hauthenticity;
		this.address = address;
	}

	// Property accessors

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	public Region getRegion() {
		return this.region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public HouseType getHouseType() {
		return this.houseType;
	}

	public void setHouseType(HouseType houseType) {
		this.houseType = houseType;
	}

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPics() {
		return this.pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getSize() {
		return this.size;
	}

	public void setSize(Double size) {
		this.size = size;
	}

	public Integer getHouseFloor() {
		return this.houseFloor;
	}

	public void setHouseFloor(Integer houseFloor) {
		this.houseFloor = houseFloor;
	}

	public Integer getDecoration() {
		return this.decoration;
	}

	public void setDecoration(Integer decoration) {
		this.decoration = decoration;
	}

	public Integer getOrientation() {
		return this.orientation;
	}

	public void setOrientation(Integer orientation) {
		this.orientation = orientation;
	}

	public String getCommunity() {
		return this.community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getHavailability() {
		return this.havailability;
	}

	public void setHavailability(Integer havailability) {
		this.havailability = havailability;
	}

	public Integer getHauthenticity() {
		return this.hauthenticity;
	}

	public void setHauthenticity(Integer hauthenticity) {
		this.hauthenticity = hauthenticity;
	}

}