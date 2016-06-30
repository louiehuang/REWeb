package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellRentDAO;
import com.chinasoft.pojo.HouseSellRent;

public class HouseSellRentService {
	private HouseSellRentDAO houseSellRentDAO;

	public HouseSellRentDAO getHouseSellRentDAO() {
		return houseSellRentDAO;
	}

	public void setHouseSellRentDAO(HouseSellRentDAO houseSellRentDAO) {
		this.houseSellRentDAO = houseSellRentDAO;
	}
	
	public List<HouseSellRent> getIndex_HouseSellRents(){
		return houseSellRentDAO.getIndex_HouseSellRents();
//		return houseSellRentDAO.findAll();
		
	}
	
	public List<HouseSellRent> findAll(){
		return houseSellRentDAO.findAll().subList(0, 4);
	}
	
	
	

}
