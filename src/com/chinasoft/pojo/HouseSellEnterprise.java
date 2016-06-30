package com.chinasoft.pojo;

/**
 * HouseSellEnterprise entity. @author MyEclipse Persistence Tools
 */

public class HouseSellEnterprise implements java.io.Serializable {

	// Fields

	private Integer HId;
	private Region region;
	private HouseType houseType;
	private EnterpriseUsers enterpriseUsers;
	private String title;
	private Integer totalNum;
	private Integer selledNum;
	private String addr;
	private String openingDate;
	private String finishDate;
	private String pics;
	private String price;
	private String downpayment;
	private String mainType;
	private String size;
	private String buildingName;
	private String developerName;
	private Integer planningNum;
	private Integer parkingNum;
	private Double manaFee;
	private String propertyName;
	private Double greeningRate;
	private Double builtupArea;
	private Double langArea;
	private Integer hauthenticity;
	private String remark;

	// Constructors

	/** default constructor */
	public HouseSellEnterprise() {
	}

	/** minimal constructor */
	public HouseSellEnterprise(Region region, HouseType houseType,
			EnterpriseUsers enterpriseUsers, String price, Integer hauthenticity) {
		this.region = region;
		this.houseType = houseType;
		this.enterpriseUsers = enterpriseUsers;
		this.price = price;
		this.hauthenticity = hauthenticity;
	}

	/** full constructor */
	public HouseSellEnterprise(Region region, HouseType houseType,
			EnterpriseUsers enterpriseUsers, String title, Integer totalNum,
			Integer selledNum, String addr, String openingDate,
			String finishDate, String pics, String price, String downpayment,
			String mainType, String size, String buildingName,
			String developerName, Integer planningNum, Integer parkingNum,
			Double manaFee, String propertyName, Double greeningRate,
			Double builtupArea, Double langArea, Integer hauthenticity,
			String remark) {
		this.region = region;
		this.houseType = houseType;
		this.enterpriseUsers = enterpriseUsers;
		this.title = title;
		this.totalNum = totalNum;
		this.selledNum = selledNum;
		this.addr = addr;
		this.openingDate = openingDate;
		this.finishDate = finishDate;
		this.pics = pics;
		this.price = price;
		this.downpayment = downpayment;
		this.mainType = mainType;
		this.size = size;
		this.buildingName = buildingName;
		this.developerName = developerName;
		this.planningNum = planningNum;
		this.parkingNum = parkingNum;
		this.manaFee = manaFee;
		this.propertyName = propertyName;
		this.greeningRate = greeningRate;
		this.builtupArea = builtupArea;
		this.langArea = langArea;
		this.hauthenticity = hauthenticity;
		this.remark = remark;
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

	public EnterpriseUsers getEnterpriseUsers() {
		return this.enterpriseUsers;
	}

	public void setEnterpriseUsers(EnterpriseUsers enterpriseUsers) {
		this.enterpriseUsers = enterpriseUsers;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getTotalNum() {
		return this.totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	public Integer getSelledNum() {
		return this.selledNum;
	}

	public void setSelledNum(Integer selledNum) {
		this.selledNum = selledNum;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getOpeningDate() {
		return this.openingDate;
	}

	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}

	public String getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public String getPics() {
		return this.pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDownpayment() {
		return this.downpayment;
	}

	public void setDownpayment(String downpayment) {
		this.downpayment = downpayment;
	}

	public String getMainType() {
		return this.mainType;
	}

	public void setMainType(String mainType) {
		this.mainType = mainType;
	}

	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getBuildingName() {
		return this.buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getDeveloperName() {
		return this.developerName;
	}

	public void setDeveloperName(String developerName) {
		this.developerName = developerName;
	}

	public Integer getPlanningNum() {
		return this.planningNum;
	}

	public void setPlanningNum(Integer planningNum) {
		this.planningNum = planningNum;
	}

	public Integer getParkingNum() {
		return this.parkingNum;
	}

	public void setParkingNum(Integer parkingNum) {
		this.parkingNum = parkingNum;
	}

	public Double getManaFee() {
		return this.manaFee;
	}

	public void setManaFee(Double manaFee) {
		this.manaFee = manaFee;
	}

	public String getPropertyName() {
		return this.propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public Double getGreeningRate() {
		return this.greeningRate;
	}

	public void setGreeningRate(Double greeningRate) {
		this.greeningRate = greeningRate;
	}

	public Double getBuiltupArea() {
		return this.builtupArea;
	}

	public void setBuiltupArea(Double builtupArea) {
		this.builtupArea = builtupArea;
	}

	public Double getLangArea() {
		return this.langArea;
	}

	public void setLangArea(Double langArea) {
		this.langArea = langArea;
	}

	public Integer getHauthenticity() {
		return this.hauthenticity;
	}

	public void setHauthenticity(Integer hauthenticity) {
		this.hauthenticity = hauthenticity;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}