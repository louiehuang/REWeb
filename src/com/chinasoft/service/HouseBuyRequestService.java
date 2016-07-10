package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseBuyRequestDAO;
import com.chinasoft.pojo.HouseBuyRequest;



public class HouseBuyRequestService {
	private HouseBuyRequestDAO houseBuyRequestDAO;

	public HouseBuyRequestDAO getHouseBuyRequestDAO() {
		return houseBuyRequestDAO;
	}

	public void setHouseBuyRequestDAO(HouseBuyRequestDAO houseBuyRequestDAO) {
		this.houseBuyRequestDAO = houseBuyRequestDAO;
	}
	
	public List<HouseBuyRequest> getBuyRequest(){
		return houseBuyRequestDAO.findAll();
	}
	
	public String save(HouseBuyRequest houseBuyRequest){
		houseBuyRequestDAO.save(houseBuyRequest);
		return "postBRequestSuccess";
	}

	
}
