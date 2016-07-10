package com.chinasoft.service;

import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.HouseBuyRentDAO;
import com.chinasoft.dao.RegionDAO;
import com.chinasoft.others.BuyerRentDetail;
import com.chinasoft.pojo.HouseBuyRent;
import com.chinasoft.pojo.Region;

public class buyerRent {
	private HouseBuyRent buyrent;
	private HouseBuyRentDAO dao;
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
	public HouseBuyRent getBuyRent() {
		return buyrent;
	}
	public void setBuyRent(HouseBuyRent buyrent) {
		this.buyrent = buyrent;
	}
	public HouseBuyRentDAO getDao() {
		return dao;
	}
	public void setDao(HouseBuyRentDAO dao) {
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


	
	//姒涙顓婚弻銉﹀閸忋劑鍎�
	public String findAll(){
		sb.delete(0,sb.length());
		List<BuyerRentDetail> list = BuyerRentDetail.findAll();	
		if(list==null){
		 	sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		}else{
	      for(int i=0 ; i < list.size();i++){
	    	   sb.append("<div>"+
	    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
	    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHouseType().getName());
	    	   sb.append("&size=");
	    	   sb.append(list.get(i).getHouseBuyRent().getSize());
	    	   sb.append("&price=");
	    	   sb.append(list.get(i).getHouseBuyRent().getPirce());
	    	   sb.append("&hDate=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHDate());
	    	   sb.append("&remark=");
	    	   sb.append(list.get(i).getHouseBuyRent().getRemark());
	    	   sb.append("&username=");
	    	   sb.append(list.get(i).getUsers().getUName());
	    	   sb.append("&credit=");
	    	   sb.append(list.get(i).getUsers().getUCredit());
	    	   sb.append("&phone=");
	    	   sb.append(list.get(i).getUsers().getUTele());
	    	   sb.append("'>");
	    	   sb.append(list.get(i).getHouseBuyRent().getTitle());
	    	   sb.append("</a><div style='float:right;'>"
	    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRent().getHouseType().getName() +"</div>"
	    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRent().getPirce()+"閸忥拷閺堬拷/div>"
	    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRent().getHDate()+"</div>"
	    	           +"</div>"
	    	        +"</div>");
	       }
	      }
		setNumber(list.size());
		return sb.toString();
	}
	
	
	
	//闂堛垻袧閻㈠崬銇囬崚鏉跨毈	
	public String arraySize(HouseBuyRent hsr){
        sb.delete(0,sb.length());
    	List<BuyerRentDetail> list = BuyerRentDetail.arraySize(hsr);	
		if(list==null){
		 	sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		}else{
	      for(int i=0 ; i < list.size();i++){
	    	   sb.append("<div>"+
	    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
	    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHouseType().getName());
	    	   sb.append("&size=");
	    	   sb.append(list.get(i).getHouseBuyRent().getSize());
	    	   sb.append("&price=");
	    	   sb.append(list.get(i).getHouseBuyRent().getPirce());
	    	   sb.append("&hDate=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHDate());
	    	   sb.append("&remark=");
	    	   sb.append(list.get(i).getHouseBuyRent().getRemark());
	    	   sb.append("&username=");
	    	   sb.append(list.get(i).getUsers().getUName());
	    	   sb.append("&credit=");
	    	   sb.append(list.get(i).getUsers().getUCredit());
	    	   sb.append("&phone=");
	    	   sb.append(list.get(i).getUsers().getUTele());
	    	   sb.append("'>");
	    	   sb.append(list.get(i).getHouseBuyRent().getTitle());
	    	   sb.append("</a><div style='float:right;'>"
	    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRent().getHouseType().getName() +"</div>"
	    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRent().getPirce()+"閸忥拷閺堬拷/div>"
	    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRent().getHDate()+"</div>"
	    	           +"</div>"
	    	        +"</div>");
	       }}
	    number = list.size();
		return sb.toString();
	
	}

	//娴犻攱鐗搁悽鍗炪亣閸掓澘鐨�
	public String arrayPirce(HouseBuyRent  hsr){
		sb.delete(0,sb.length());
		List<BuyerRentDetail> list = BuyerRentDetail.arrayPirce(hsr);	
		if(list==null){
		 	sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		}else{
	      for(int i=0 ; i < list.size();i++){
	    	   sb.append("<div>"+
	    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
	    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHouseType().getName());
	    	   sb.append("&size=");
	    	   sb.append(list.get(i).getHouseBuyRent().getSize());
	    	   sb.append("&price=");
	    	   sb.append(list.get(i).getHouseBuyRent().getPirce());
	    	   sb.append("&hDate=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHDate());
	    	   sb.append("&remark=");
	    	   sb.append(list.get(i).getHouseBuyRent().getRemark());
	    	   sb.append("&username=");
	    	   sb.append(list.get(i).getUsers().getUName());
	    	   sb.append("&credit=");
	    	   sb.append(list.get(i).getUsers().getUCredit());
	    	   sb.append("&phone=");
	    	   sb.append(list.get(i).getUsers().getUTele());
	    	   sb.append("'>");
	    	   sb.append(list.get(i).getHouseBuyRent().getTitle());
	    	   sb.append("</a><div style='float:right;'>"
	    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRent().getHouseType().getName() +"</div>"
	    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRent().getPirce()+"閸忥拷閺堬拷/div>"
	    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRent().getHDate()+"</div>"
	    	           +"</div>"
	    	        +"</div>");
	       }}number = list.size();
			return sb.toString();		
	}

	public List<Region> findCounty(String province,String city){
		
		List<Region> list = new ArrayList<Region>();
		list = regionDAO.findCounty(province, city);
		return list;
		
	}
	//婢舵碍娼禒鑸电叀鐠囷拷
	public String getOptions(double Pirce[],int Size[],int HouseFloor,String Addr){
		sb.delete(0,sb.length());
		List<BuyerRentDetail> list = BuyerRentDetail.findAll(Pirce,Size,HouseFloor,Addr);	
		if(list==null){
		 	sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		}else{
	      for(int i=0 ; i < list.size();i++){
	    	   sb.append("<div>"+
	    	           "<div style='padding:15px 5px;border-bottom:whitesmoke solid onmouseout='this.style.backgroundColor='white'' onmouseover='this.style.backgroundColor='lightyellow''>"
	    	               +"<a class='sss' href='details_buyer.jsp?houseType=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHouseType().getName());
	    	   sb.append("&size=");
	    	   sb.append(list.get(i).getHouseBuyRent().getSize());
	    	   sb.append("&price=");
	    	   sb.append(list.get(i).getHouseBuyRent().getPirce());
	    	   sb.append("&hDate=");
	    	   sb.append(list.get(i).getHouseBuyRent().getHDate());
	    	   sb.append("&remark=");
	    	   sb.append(list.get(i).getHouseBuyRent().getRemark());
	    	   sb.append("&username=");
	    	   sb.append(list.get(i).getUsers().getUName());
	    	   sb.append("&credit=");
	    	   sb.append(list.get(i).getUsers().getUCredit());
	    	   sb.append("&phone=");
	    	   sb.append(list.get(i).getUsers().getUTele());
	    	   sb.append("'>");
	    	   sb.append(list.get(i).getHouseBuyRent().getTitle());
	    	   sb.append("</a><div style='float:right;'>"
	    	              +"<div style='margin-right: 120px;float:left;'>"+list.get(i).getHouseBuyRent().getHouseType().getName() +"</div>"
	    	              +"<div style='float:left;margin-right: 120px;'>"+list.get(i).getHouseBuyRent().getPirce()+"元/月</div>"
	    	              +"<div style='float:left;'>"+list.get(i).getHouseBuyRent().getHDate()+"</div>"
	    	           +"</div>"
	    	        +"</div>");
	       }
		}	
		number=list.size();
        return sb.toString();	
	}

}
