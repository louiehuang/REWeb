package com.chinasoft.service;

import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.HouseSellSecondhandDAO;
import com.chinasoft.dao.RegionDAO;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Region;

public class secondhouse {
	private HouseSellSecondhand secondhouse;
	private HouseSellSecondhandDAO dao;
	private RegionDAO regionDAO;
	private int number;
	private StringBuilder sb = new StringBuilder();
	
	
	//set get
	public HouseSellSecondhand getSecondhouse() {
		return secondhouse;
	}
	public void setSecondhouse(HouseSellSecondhand secondhouse) {
		this.secondhouse = secondhouse;
	}
	public HouseSellSecondhandDAO getDao() {
		return dao;
	}
	public void setDao(HouseSellSecondhandDAO dao) {
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
	public RegionDAO getRegionDAO() {
		return regionDAO;
	}
	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}

	//根据省市查询区
	public List<Region> findCounty(String province,String city){
		
		List<Region> list = new ArrayList<Region>();
		list = regionDAO.findCounty(province, city);
		return list;
		
	}
	
	//默认 按钮查找全部
	@SuppressWarnings("unchecked")
	public String findAll(){
		List<HouseSellSecondhand> list = new ArrayList<HouseSellSecondhand>();		
		list.addAll(dao.findAll());
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){				
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics().split(";")[0]+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");

				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>万元</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>价格：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>万元</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
			}
		}
			number = list.size();
			return sb.toString();
		
	}

	
	//面积由大到小
	public String arraySize(HouseSellSecondhand hss){
		List<HouseSellSecondhand> list = new ArrayList<HouseSellSecondhand>();		
		//list.addAll(dao.findBySize(100000000));
		list=dao.arrayPrice(hss);
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics().split(";")[0]+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>万元</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>价格：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>万元</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
			}
		}
	        number = list.size();
			return sb.toString();
	
	}

	//价格由大到小

	public String arrayPrice(HouseSellSecondhand hss){
		List<HouseSellSecondhand> list = new ArrayList<HouseSellSecondhand>();
		list=dao.arraySize(hss);
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
			for(int i=0 ; i < list.size();i++){
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics().split(";")[0]+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>万元</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>价格：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>万元</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
			}
		}
            number = list.size();
			return sb.toString();		
	}
	
	//多条件查询
	public String getOption(double price[], int size[], String community,int floor) {

		List<HouseSellSecondhand> list = new ArrayList<HouseSellSecondhand>();
		list=dao.getOptions(price, size, floor,community);
		// TODO Auto-generated method stub
		if(list==null)
			sb.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
		else{
		  for(int i=0 ; i < list.size();i++){
				sb.append("<div class='container'><div class='box'>");
				sb.append("<div class='img'><img src='"+list.get(i).getPics().split(";")[0]+"' align='middle'>");
				sb.append("</div><ul class='list'><li style='margin-top:12px;'>");
				sb.append("<span style='font-size: 24px;font-family:'微软雅黑';'>"+ list.get(i).getTitle()+ "</span></li>");
				sb.append("<li style='margin-top:10px;'><span style='font-size: 15px;font-family:'微软雅黑';color:gray;'>");
				sb.append("<img src='images/houselist/locate_grey.png'>"+ list.get(i).getOrientation()+"&nbsp;"+list.get(i).getCommunity()+"</span></li>");
				
				sb.append("<a href='/ysl/1565#houseImg-a' target='_blank'>&nbsp;面积：</a>"+list.get(i).getSize()+"<span>&nbsp;|");
				sb.append( "<li style='margin-top:10px;'><span><img src='images/houselist/look.png' align='middle'>报名看房，免费车接送</span></li>");
				sb.append("</ul>");
				sb.append("</div>");
				sb.append("<div align='right'>");
				sb.append("<span><font size='8' color='89d6bc'><b>"+ list.get(i).getPrice()+"</b></font></span>");
				sb.append("<font color='gray'>万元</font></div>");
				sb.append("<div align='right'><span style='font-size: 15px;font-family:'微软雅黑';margin-top:60px;'>价格：");
				sb.append("<span style=''font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getPrice()+"</span>万元</span></span> &nbsp;");
				sb.append("<span style='font-size: 15px;font-family:'微软雅黑';'>");
				sb.append("面积：<span style='font-size: 15px;font-family:'微软雅黑';'>"+ list.get(i).getSize()+"</span>㎡</span></div></div><br/>");
			}
	    }
        number = list.size();
		return sb.toString();		
	}
	
}
