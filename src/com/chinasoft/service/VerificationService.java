package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.VerificationDAO;
import com.chinasoft.pojo.Verification;

public class VerificationService {

	VerificationDAO verificationDAO = new VerificationDAO();

	public VerificationDAO getVerificationDAO() {
		return verificationDAO;
	}

	public void setVerificationDAO(VerificationDAO verificationDAO) {
		this.verificationDAO = verificationDAO;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Verification> findAll(){
		return verificationDAO.findAll();
	}
	
	public void update(Verification veri){
		verificationDAO.update(veri);
	}
	
	public Verification findById(Integer id){
		return verificationDAO.findById(id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Verification> findByVstatus(Integer vstatus) {
		return verificationDAO.findByVstatus(vstatus);
	}
	
	

}
