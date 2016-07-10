package com.chinasoft.service;

import com.chinasoft.dao.RegionDAO;
import com.chinasoft.pojo.Region;

public class RegionService {
     private RegionDAO regionDAO;
	
	public RegionDAO getRegionDAO() {
		return regionDAO;
	}

	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}

	public Integer getRegionId(String province,String city,String county){
	   Region region = regionDAO.findByRegion(province,city,county);
	   if(region!=null)
		   return region.getRegionId();
	   else 
		   return -1;
	}
}
