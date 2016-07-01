package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.service.HouseSellEnterpriseService;

public class HouseSellEnterpriseAction {
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private List<HouseSellEnterprise> list;
	
	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}
	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}
	public List<HouseSellEnterprise> getList() {
		return list;
	}
	public void setList(List<HouseSellEnterprise> list) {
		this.list = list;
	}
	
	public String getSellNewInfo(){
		list = houseSellEnterpriseService.getSellNewInfo();
		
		if (list != null) {
			return "success";
		} else {
			return "error";
		}		
	}
	
	public List<HouseSellEnterprise> Test1(){
		return houseSellEnterpriseService.getSellNewInfo();
	}
	
	
	
	
}
