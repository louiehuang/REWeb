package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.service.HouseSellEnterpriseService;

/**
 * 出售企业新房Action
 * @author hlyin
 *
 */
public class HouseSellEnterpriseAction {
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private List<HouseSellEnterprise> list; //接收首页显示的4条新房信息，返回给首页index.jsp
	
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
