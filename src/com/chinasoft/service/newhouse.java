package com.chinasoft.service;

import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.HouseSellEnterpriseDAO;
import com.chinasoft.dao.RegionDAO;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.Region;

public class newhouse {
	private HouseSellEnterpriseDAO  dao;
	private HouseSellEnterprise newhouse;
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
	public HouseSellEnterpriseDAO getDao() {
		return dao;
	}
	public void setDao(HouseSellEnterpriseDAO dao) {
		this.dao = dao;
	}
	public HouseSellEnterprise getNewhouse() {
		return newhouse;
	}
	public void setNewhouse(HouseSellEnterprise newhouse) {
		this.newhouse = newhouse;
	}
	
	
	
	//默认查找全部
	public String findAll(){
		List<HouseSellEnterprise> list = new ArrayList<HouseSellEnterprise>();		
		list=dao.findAll();
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
		    String type ;
			for(int i=0 ; i < list.size();i++){	
				 type = list.get(i).getMainType();
				 String[]T=type.split(";");
				 
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics().split(";")[0]+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span>");
				sb.append("<span style='font-size: 20px;font-family:'微软雅黑';'>（"+list.get(i).getBuildingName()+ "）</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getAddr()+"</span></li>");
				sb.append( "<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';'>主力户型：");
				
				//户型
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;</a>");
				for(int j=0;j<T.length;j++){
					sb.append(T[j] +"<span>&nbsp;|</span>");
				}
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;管理费：</a>"+list.get(i).getManaFee()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送，绿化面积"+list.get(i).getGreeningRate()+"</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice().split(";")[0]+"</b></font></span>");
				sb.append("<font color='gray'>元/m²</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>首付：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getDownpayment()+"</span>元起</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		 }
		}
			number = list.size();
			return sb.toString();
		
	}
	


	//根据省市，查询区
	public List<Region> findCounty(String province,String city){
		
		List<Region> list = new ArrayList<Region>();
		list = regionDAO.findCounty(province, city);
		return list;
		
	}
	
	//面积由大到小
	public String arraySize(HouseSellEnterprise hse){
		List<HouseSellEnterprise> list = new ArrayList<HouseSellEnterprise>();		
		list=dao.arraySize(hse);
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
		    String type ;
			for(int i=0 ; i < list.size();i++){
				type = list.get(i).getMainType();
				String[]T=type.split(";");
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span>");
				sb.append("<span style='font-size: 20px;font-family:'微软雅黑';'>（"+list.get(i).getBuildingName()+ "）</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getAddr()+"</span></li>");
				sb.append( "<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';'>主力户型：");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;</a>");
				for(int j=0;j<T.length;j++){
					sb.append(T[j] +"<span>&nbsp;|</span>");
				}
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;管理费：</a>"+list.get(i).getManaFee()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送，绿化面积"+list.get(i).getGreeningRate()+"</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice().split(";")[0]+"</b></font></span>");
				sb.append("<font color='gray'>元/m²</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>首付：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getDownpayment()+"</span>元起</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		    }
		 }
			number = list.size();
			return sb.toString();
	
	}

	//价格由大到小
	public String arrayPrice(HouseSellEnterprise hse){
		List<HouseSellEnterprise> list = new ArrayList<HouseSellEnterprise>();		
		list=dao.arrayPrice(hse);
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
		    String type ;
			for(int i=0 ; i < list.size();i++){
				 type = list.get(i).getMainType();
				 String[]T=type.split(";");
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'/>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getBuildingName()+ "</span>");
				sb.append("<span style='font-size: 20px;font-family:'微软雅黑';'>（"+list.get(i).getBuildingName()+ "）</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getAddr()+"</span></li>");
				sb.append( "<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';'>主力户型：");

				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;</a>");
				for(int j=0;j<T.length;j++){
					sb.append(T[j] +"<span>&nbsp;|</span>");
				}
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;管理费：</a>"+list.get(i).getManaFee()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送，绿化面积"+list.get(i).getGreeningRate()+"</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice().split(";")[0]+"</b></font></span>");
				sb.append("<font color='gray'>元/m²</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>首付：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getDownpayment()+"</span>元起</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
		   }
		  }
		    number = list.size();
			return sb.toString();		
	}

	//多条件查询
	public String getOption(double price[],int size[],String area,String type){
		List<HouseSellEnterprise> list = new ArrayList<HouseSellEnterprise>();
		list=dao.getOptions(price, size, area, type);
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
		   String type_1 ;
		   for(int i=0 ; i < list.size();i++){
			 type_1 = list.get(i).getMainType();
			 String[]T=type_1.split(";");
			 
			sb.append("<div class='container'><div class='box'>");
			sb.append("<div class='img'><img src='"+list.get(i).getPics()+"' align='middle'>");
			sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
			sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span>");
			sb.append("<span style='font-size: 20px;font-family:'微软雅黑';'>（"+list.get(i).getBuildingName()+ "）</span></li>");
			sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
			sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getAddr()+"</span></li>");
			sb.append( "<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';'>主力户型：");
		
			sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;</a>");
			for(int j=0;j<T.length;j++){
				
				sb.append(T[j] +"<span>&nbsp;|</span>");
				
				}
			
			sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;管理费：</a>"+list.get(i).getManaFee()+"<span>&nbsp;|");
			sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送，绿化面积"+list.get(i).getGreeningRate()+"</span></li>");
			sb.append("</ul>");
			sb.append("</div>");
			sb.append("<div align='right'>");
			sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice().split(";")[0]+"</b></font></span>");
			sb.append("<font color='gray'>元/m²</font></div>");
			sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>首付：");
			sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getDownpayment()+"</span>元起</span></span> &nbsp;");
			sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
			sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
	   }
	}
        number = list.size();
		return sb.toString();		
	}
	
}
