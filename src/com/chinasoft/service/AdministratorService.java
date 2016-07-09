package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.AdministratorDAO;
import com.chinasoft.pojo.Administrator;

public class AdministratorService {

	private AdministratorDAO administratorDAO;

	public AdministratorDAO getAdministratorDAO() {
		return administratorDAO;
	}

	public void setAdministratorDAO(AdministratorDAO administratorDAO) {
		this.administratorDAO = administratorDAO;
	}
	
	@SuppressWarnings("unchecked")
	public List<Administrator> findByExample(Administrator admin){
		return administratorDAO.findByExample(admin);
	}
	
}
