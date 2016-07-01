package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellEnterpriseDAO;
import com.chinasoft.dao.HouseSellRentDAO;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;

public class IndexService {

	private HouseSellEnterpriseDAO houseSellEnterpriseDAO;
	private HouseSellRentDAO houseSellRentDAO;
	
	public HouseSellEnterpriseDAO getHouseSellEnterpriseDAO() {
		return houseSellEnterpriseDAO;
	}
	public void setHouseSellEnterpriseDAO(
			HouseSellEnterpriseDAO houseSellEnterpriseDAO) {
		this.houseSellEnterpriseDAO = houseSellEnterpriseDAO;
	}
	public HouseSellRentDAO getHouseSellRentDAO() {
		return houseSellRentDAO;
	}
	public void setHouseSellRentDAO(HouseSellRentDAO houseSellRentDAO) {
		this.houseSellRentDAO = houseSellRentDAO;
	}
	
	public List<HouseSellRent> getRentInfo(){
		List<HouseSellRent> list = houseSellRentDAO.getRentInfo();
		int length = list.size();
//		return list.subList(length - 4, length); //返回最后4条
		
		return list.subList(0, 4); //返回前4条
	}
	
	public List<HouseSellEnterprise> getSellNewInfo(){
		return houseSellEnterpriseDAO.getSellNewInfo();
	}
	
	
	

}
