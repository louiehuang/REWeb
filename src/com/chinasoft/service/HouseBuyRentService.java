package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseBuyRentDAO;
import com.chinasoft.pojo.HouseBuyRent;

public class HouseBuyRentService {
   private HouseBuyRentDAO houseBuyRentDAO;

   public HouseBuyRentDAO getHouseBuyRentDAO() {
	  return houseBuyRentDAO;
   }

   public void setHouseBuyRentDAO(HouseBuyRentDAO houseBuyRentDAO) {
	   this.houseBuyRentDAO = houseBuyRentDAO;
   }
   
   public List getBuyRent(){
		return houseBuyRentDAO.findAll();
	}
   
   public String save(HouseBuyRent houseBuyRent){
	   houseBuyRentDAO.save(houseBuyRent);
	   return "postBRentSuccess";
   }
}
