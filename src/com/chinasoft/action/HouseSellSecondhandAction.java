package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.service.HouseSellSecondhandService;

public class HouseSellSecondhandAction {
	private HouseSellSecondhandService houseSellSecondhandService;
	List<HouseSellSecondhand> list;
	
	
	
	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}

	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}

	public List<HouseSellSecondhand> getList() {
		return list;
	}

	public void setList(List<HouseSellSecondhand> list) {
		this.list = list;
	}



	public String getSellOldInfo() {
		list = houseSellSecondhandService.getSellOldInfo();
		
		if (list != null) {
			return "success";
		} else {
			return "error";
		}
	
	}

}
