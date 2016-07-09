package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.EnterpriseUsersDAO;
import com.chinasoft.pojo.EnterpriseUsers;

public class EnterpriseUsersService {
	private EnterpriseUsersDAO enterpriseUsersDAO;

	public EnterpriseUsersDAO getEnterpriseUsersDAO() {
		return enterpriseUsersDAO;
	}

	public void setEnterpriseUsersDAO(EnterpriseUsersDAO enterpriseUsersDAO) {
		this.enterpriseUsersDAO = enterpriseUsersDAO;
	}
	
	
	
	public List<EnterpriseUsers> findByExample(EnterpriseUsers euser){
		return enterpriseUsersDAO.findByExample(euser);
	}
	
	
	
	

}
