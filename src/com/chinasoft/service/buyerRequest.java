package com.chinasoft.service;

import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.HouseBuyRequestDAO;
import com.chinasoft.dao.RegionDAO;
import com.chinasoft.others.BuyerDetail;
import com.chinasoft.pojo.HouseBuyRequest;
import com.chinasoft.pojo.Region;

public class buyerRequest {
	private HouseBuyRequest buyrequest;
	private HouseBuyRequestDAO dao;
	private int number;
	private StringBuilder sb = new StringBuilder();
	private RegionDAO regionDAO;
	private Region region;
	
	//set get
	public RegionDAO getRegionDAO() {
		return regionDAO;
	}
	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public HouseBuyRequest getBuyRequest() {
		return buyrequest;
	}
	public void setBuyRequest(HouseBuyRequest buyrequest) {
		this.buyrequest = buyrequest;
	}
	public HouseBuyRequestDAO getDao() {
		return dao;
	}
	public void setDao(HouseBuyRequestDAO dao) {
		this.dao = dao;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public StringBuilder getSb() {
		return sb;
	}
	public void setSb(StringBuilder sb) {
		this.sb = sb;
	}

	
	
	//根据省市查询区
	public List<Region> findCounty(String province,String city){
		
		List<Region> list = new ArrayList<Region>();
		list = regionDAO.findCounty(province, city);
		return list;
		
	}
	
	//默认查找全部
	public String findAll(){
		sb.delete(0,sb.length());
		List<BuyerDetail> list = BuyerDetail.findAll();	
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				 sb.append("<div>"+
		    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
		    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getHouseType().getName());
		    	   sb.append("&size=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getSize());
		    	   sb.append("&price=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getPirce());
		    	   sb.append("&hDate=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getHdate());
		    	   sb.append("&remark=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getRemark());
		    	   sb.append("&username=");
		    	   sb.append(list.get(i).getUsers().getUName());
		    	   sb.append("&credit=");
		    	   sb.append(list.get(i).getUsers().getUCredit());
		    	   sb.append("&phone=");
		    	   sb.append(list.get(i).getUsers().getUTele());
		    	   sb.append("'>");
		    	   sb.append(list.get(i).getHouseBuyRequest().getTitle());
		    	   sb.append("</a><div style='float:right;'>"
		    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRequest().getHouseType().getName() +"</div>"
		    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRequest().getPirce()+"元/月</div>"
		    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRequest().getHdate()+"</div>"
		    	           +"</div>"
		    	        +"</div>");
					}
		}
		setNumber(list.size());
		return sb.toString();
	}
	
	
	
	//面积由大到小	
	public String arraySize(HouseBuyRequest hsr){
		sb.delete(0,sb.length());
		List<BuyerDetail> list = BuyerDetail.arrayPirce(hsr);	
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				 sb.append("<div>"+
		    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
		    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getHouseType().getName());
		    	   sb.append("&size=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getSize());
		    	   sb.append("&price=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getPirce());
		    	   sb.append("&hDate=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getHdate());
		    	   sb.append("&remark=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getRemark());
		    	   sb.append("&username=");
		    	   sb.append(list.get(i).getUsers().getUName());
		    	   sb.append("&credit=");
		    	   sb.append(list.get(i).getUsers().getUCredit());
		    	   sb.append("&phone=");
		    	   sb.append(list.get(i).getUsers().getUTele());
		    	   sb.append("'>");
		    	   sb.append(list.get(i).getHouseBuyRequest().getTitle());
		    	   sb.append("</a><div style='float:right;'>"
		    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRequest().getHouseType().getName() +"</div>"
		    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRequest().getPirce()+"元/月</div>"
		    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRequest().getHdate()+"</div>"
		    	           +"</div>"
		    	        +"</div>");
					}
		}
	    number = list.size();
		return sb.toString();
	
	}

	//价格由大到小	
	public String arrayPirce(HouseBuyRequest  hsr){
		sb.delete(0,sb.length());
		List<BuyerDetail> list = BuyerDetail.arrayPirce(hsr);	
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				 sb.append("<div>"+
		    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
		    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getHouseType().getName());
		    	   sb.append("&size=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getSize());
		    	   sb.append("&price=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getPirce());
		    	   sb.append("&hDate=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getHdate());
		    	   sb.append("&remark=");
		    	   sb.append(list.get(i).getHouseBuyRequest().getRemark());
		    	   sb.append("&username=");
		    	   sb.append(list.get(i).getUsers().getUName());
		    	   sb.append("&credit=");
		    	   sb.append(list.get(i).getUsers().getUCredit());
		    	   sb.append("&phone=");
		    	   sb.append(list.get(i).getUsers().getUTele());
		    	   sb.append("'>");
		    	   sb.append(list.get(i).getHouseBuyRequest().getTitle());
		    	   sb.append("</a><div style='float:right;'>"
		    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRequest().getHouseType().getName() +"</div>"
		    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRequest().getPirce()+"元/月</div>"
		    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRequest().getHdate()+"</div>"
		    	           +"</div>"
		    	        +"</div>");
					}
		}number = list.size();
			return sb.toString();		
	}

	//多条件查询
	public String getOptions(double Pirce[],int Size[],int HouseFloor,String Addr){
		sb.delete(0,sb.length());
		List<BuyerDetail> list = BuyerDetail.findAll(Pirce,Size,HouseFloor,Addr);	
		if(list==null){
		 	sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		}else{
	      for(int i=0 ; i < list.size();i++){
	    	   sb.append("<div>"+
	    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
	    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
	    	   sb.append(list.get(i).getHouseBuyRequest().getHouseType().getName());
	    	   sb.append("&size=");
	    	   sb.append(list.get(i).getHouseBuyRequest().getSize());
	    	   sb.append("&price=");
	    	   sb.append(list.get(i).getHouseBuyRequest().getPirce());
	    	   sb.append("&hDate=");
	    	   sb.append(list.get(i).getHouseBuyRequest().getHdate());
	    	   sb.append("&remark=");
	    	   sb.append(list.get(i).getHouseBuyRequest().getRemark());
	    	   sb.append("&username=");
	    	   sb.append(list.get(i).getUsers().getUName());
	    	   sb.append("&credit=");
	    	   sb.append(list.get(i).getUsers().getUCredit());
	    	   sb.append("&phone=");
	    	   sb.append(list.get(i).getUsers().getUTele());
	    	   sb.append("'>");
	    	   sb.append(list.get(i).getHouseBuyRequest().getTitle());
	    	   sb.append("</a><div style='float:right;'>"
	    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRequest().getHouseType().getName() +"</div>"
	    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRequest().getPirce()+"元/月</div>"
	    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRequest().getHdate()+"</div>"
	    	           +"</div>"
	    	        +"</div>");
	       }
		}
		number=list.size();
        return sb.toString();	
	}

}
