 	package com.chinasoft.service;

import com.chinasoft.dao.HouseTypeDAO;

public class HouseTypeService {
	
	private HouseTypeDAO houseTypeDAO;

	public HouseTypeDAO getHouseTypeDAO() {
		return houseTypeDAO;
	}

	public void setHouseTypeDAO(HouseTypeDAO houseTypeDAO) {
		this.houseTypeDAO = houseTypeDAO;
	}
	
	public int getHTypeId(String name){
		return houseTypeDAO.findIdByName(name);
	}
}
