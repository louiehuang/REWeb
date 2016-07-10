package com.chinasoft.service;

import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.HouseSellRentDAO;
import com.chinasoft.dao.RegionDAO;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.Region;

public class renthouse {
	private HouseSellRent renthouse;
	private HouseSellRentDAO dao;
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
	public HouseSellRent getRenthouse() {
		return renthouse;
	}
	public void setRenthouse(HouseSellRent renthouse) {
		this.renthouse = renthouse;
	}
	public HouseSellRentDAO getDao() {
		return dao;
	}
	public void setDao(HouseSellRentDAO dao) {
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
		List<HouseSellRent> list = new ArrayList<HouseSellRent>();		
		list=dao.findAll();
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){				
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>元/月</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>月租：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>元/月起</span>&nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		}
		}
		setNumber(list.size());
		return sb.toString();
	}
	
	
	
	//面积由大到小	
	public String arraySize(HouseSellRent hsr){
        sb.delete(0,sb.length());
		List<HouseSellRent> list = new ArrayList<HouseSellRent>();		
		list=dao.arraySize(hsr);		
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>元/月</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>月租：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>元/月起</span>&nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		}
		}
	    number = list.size();
		return sb.toString();
	
	}

	//价格由大到小	
	public String arrayPrice(HouseSellRent  hsr){
		sb.delete(0,sb.length());
		List<HouseSellRent> list = new ArrayList<HouseSellRent>();		
		list=dao.arrayPrice(hsr);	
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>元/月</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>月租：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>元/月起</span>&nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		}
		}number = list.size();
			return sb.toString();		
	}

	//多条件查询
	public String getOptions(double Price[],int Size[],int HouseFloor,String Addr){
		sb.delete(0,sb.length());
		List<HouseSellRent> list = new ArrayList<HouseSellRent>();		
		list=dao.getOptions(Price,Size,HouseFloor,Addr);	
		if(list==null){
		 	sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		}else{
	      for(int i=0 ; i < list.size();i++){
	    		sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>元/月</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>月租：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>元/月起</span>&nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		}
		}
		number=list.size();
        return sb.toString();	
	}

}
