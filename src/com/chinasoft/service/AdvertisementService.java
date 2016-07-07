package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.AdvertisementDAO;
import com.chinasoft.pojo.Advertisement;

public class AdvertisementService {
	private AdvertisementDAO advertisementDAO;

	public AdvertisementDAO getAdvertisementDAO() {
		return advertisementDAO;
	}

	public void setAdvertisementDAO(AdvertisementDAO advertisementDAO) {
		this.advertisementDAO = advertisementDAO;
	}
	
	@SuppressWarnings("unchecked")
	public List<Advertisement> findAll(){
		return advertisementDAO.findAll();
	}
	
	public void delete(Advertisement ad){
		advertisementDAO.delete(ad);
	}
	
	public void update(Advertisement ad){
		advertisementDAO.update(ad);
	}
	
	public Advertisement findById(Integer id){
		return advertisementDAO.findById(id);
	}
	

}
