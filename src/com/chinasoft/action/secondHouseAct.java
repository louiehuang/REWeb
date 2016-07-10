package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Region;
import com.chinasoft.service.secondhouse;

public class secondHouseAct {
	private HouseSellSecondhand hss;
	private secondhouse shouse;
	private StringBuilder sth = new StringBuilder();
	private Region region;
	private int num;
	private int price;
	private int size;
	private String province;
	private int floor;
	private String Addr;
	private String county;
	private String city;
	
	//保存每次传过来的值
	private int price_1 = 0;
	private int size_1 = 0;
	private int floor_1 = 0;
	private String county_1;
	private String province_1="湖北省" ;
	private String city_1="武汉市";
	private String Addr_1;
	private List<Region> getCounty; 
	
	
//set和get方法
	
	public String getAddr() {
		return Addr;
	}
	public String getProvince_1() {
		return province_1;
	}
	public void setProvince_1(String province_1) {
		this.province_1 = province_1;
	}
	public String getAddr_1() {
		return Addr_1;
	}
	public void setAddr_1(String addr_1) {
		Addr_1 = addr_1;
	}
	public String getCounty_1() {
		return county_1;
	}
	public void setCounty_1(String county_1) {
		this.county_1 = county_1;
	}
	public String getCity_1() {
		return city_1;
	}
	public void setCity_1(String city_1) {
		this.city_1 = city_1;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public int getPrice_1() {
		return price_1;
	}
	public void setPrice_1(int price_1) {
		this.price_1 = price_1;
	}
	public int getSize_1() {
		return size_1;
	}
	public void setSize_1(int size_1) {
		this.size_1 = size_1;
	}
	public int getFloor_1() {
		return floor_1;
	}
	public void setFloor_1(int floor_1) {
		this.floor_1 = floor_1;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public HouseSellSecondhand getHss() {
		return hss;
	}
	public void setHss(HouseSellSecondhand hss) {
		this.hss = hss;
	}
	public secondhouse getShouse() {
		return shouse;
	}
	public void setShouse(secondhouse shouse) {
		this.shouse = shouse;
	}
	public StringBuilder getSth() {
		return sth;
	}
	public void setSth(StringBuilder sth) {
		this.sth = sth;
	}	
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public List<Region> getGetCounty() {
		return getCounty;
	}
	public void setGetCounty(List<Region> getCounty) {
		this.getCounty = getCounty;
	}
	

	public String execute() throws Exception{
		try{
			sth.setLength(0);
			num=0;
			city_1="武汉市";
			province_1="湖北省";
            size_1 = 0;
			price_1 = 0;
			floor_1 = 0;
			size_1 = size;
			price_1 = price;
			floor_1 = floor;
			city_1=city;
			province_1=province;
			county_1=county;
			if(province_1==null)
				province_1="湖北省";
			if(city_1==null)
				city_1="武汉市";
			if(county_1==null)
				Addr_1="不限";
			else
			   Addr_1=province_1 + city_1 + county_1;
			getCounty = shouse.findCounty(province_1, city_1);
			getOption();
			return "SUCCESS";
		
		}catch(Exception e) {
			sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			return "ERROR";
		}
	}
	
	
		//面积排序
		public String arraySize()throws Exception{
			try {
				sth.setLength(0);
				sth.append(shouse.arraySize(hss));
				num = shouse.getNumber();
				if(num==0){
				    sth.setLength(0);
					sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			    }return "arraySize";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
				return "ERROR";
			}		
		}
		
		//价格排序
		public String arrayPrice()throws Exception{
			try {
				sth.setLength(0);
				sth.append(shouse.arrayPrice(hss));
				num = shouse.getNumber();
				if(num==0){
				    sth.setLength(0);
					sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			    }return "arrayPrice";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
				return "ERROR";
			}		
			
		}
		//条件查询
		public void getOption()throws Exception{
			try{	
				sth.setLength(0);
				num=0;
				int S[]=new int[2];
				double P[] = new double[2];
				switch(price_1){
				case 0: P[0]=0;P[1]=500000;break;
				case 1: P[0]=500000;P[1]=1000000;break;
				case 2: P[0]=1000000;P[1]=1500000;break;
				case 3: P[0]=1500000;P[1]=2000000;break;
				case 4: P[0]=2000000;P[1]=999999999;break;
				default:  P[0]=0;P[1]=999999999;break;				
				}
				
				switch(size_1){
				case 0: S[0]=0;S[1]=50; break;
				case 1: S[0]=50;S[1]=100;break;
				case 2: S[0]=100;S[1]=150;break;
				case 3: S[0]=150;S[1]=200;break;
				case 4: S[0]=200;S[1]=999999999;break;
				default:  S[0]=0;S[1]=999999999;break;
				
				}
				sth.append(shouse.getOption(P, S, Addr_1, floor_1));
				 num = shouse.getNumber();
				if(num == 0){
					sth.setLength(0);
					sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
					
				}
		
			}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");

		}		
		
		
		}
		
	//不限,默认   做个按钮reset
		public String noLimit() throws Exception{
			try {
				price_1=0;
				size_1=0;
				floor_1=0;
				sth.setLength(0);
				sth.append(shouse.findAll());		
				num=shouse.getNumber();
				if(num==0){
				    sth.setLength(0);
					sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			    }return "noLimit";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
				return "ERROR";
			}	
		}

}
