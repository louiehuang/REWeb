package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseType;
import com.chinasoft.service.HouseTypeService;

public class HouseTypeAction {
	private HouseTypeService houseTypeService;
	private List<HouseType> list;
	
	public HouseTypeService getHouseTypeService() {
		return houseTypeService;
	}
	public void setHouseTypeService(HouseTypeService houseTypeService) {
		this.houseTypeService = houseTypeService;
	}
	public List<HouseType> getList() {
		return list;
	}
	public void setList(List<HouseType> list) {
		this.list = list;
	}
	
	
	

}
