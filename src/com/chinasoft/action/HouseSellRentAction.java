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

	/**
	 * 获取房屋出租信息供首页显示，4条
	 * @return
	 * 成功返回success，跳转
	 */
	public String getRentInfo() {
		list = houseSellRentService.getRentInfo();
//		list = houseSellRentService.findAll();
		
		if (list != null) {
			return "success";
		} else {
			return "error";
		}
	}
	
	
	public List<HouseSellRent> Test() {
		return houseSellRentService.getRentInfo();
	}
	

}





