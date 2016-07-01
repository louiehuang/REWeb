package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.service.HouseSellRentService;

public class HouseSellRentAction {
	private HouseSellRentService houseSellRentService;
	private HouseSellRent houseSellRent;
	private List<HouseSellRent> list;

	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}

	public void setHouseSellRentService(
			HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}

	public HouseSellRent getHouseSellRent() {
		return houseSellRent;
	}

	public void setHouseSellRent(HouseSellRent houseSellRent) {
		this.houseSellRent = houseSellRent;
	}

	public List<HouseSellRent> getList() {
		return list;
	}

	public void setList(List<HouseSellRent> list) {
		this.list = list;
	}

	public String getRentInfo() {
		list = houseSellRentService.getRentInfo();
//		list = houseSellRentService.findAll();
		
		if (list != null) {
			return "success";
		} else {
			return "error";
		}
	}
	
	
	
	public List<HouseSellRent> Test1() {
		return houseSellRentService.getRentInfo();
	}
	
	public List<HouseSellRent> Test2() {
		return houseSellRentService.findAll();
	}


}





