package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.Region;
import com.chinasoft.service.renthouse;

public class rentHouseAct {
	private HouseSellRent hsr;
	private renthouse  rhouse;
	private StringBuilder sth = new StringBuilder();
	private int num;
	private int price = 0;
	private int size = 0;
	private String county;
	private String province;
	private String city;
	private int floor = 0;
	private List<Region> getCounty;
	
	
	//保存每次传过来的值
		private int price_1 = 0;
		private int size_1 = 0;
		private int floor_1 = 0;
		private String county_1;
		private String province_1="湖北省" ;
		private String city_1="武汉市";
		private String Addr_1;
	
//set   get
		
		
	public List<Region> getGetCounty() {
			return getCounty;
		}
	public String getCounty_1() {
		return county_1;
	}
	public void setCounty_1(String county_1) {
		this.county_1 = county_1;
	}
	public String getProvince_1() {
		return province_1;
	}
	public void setProvince_1(String province_1) {
		this.province_1 = province_1;
	}
	public String getCity_1() {
		return city_1;
	}
	public void setCity_1(String city_1) {
		this.city_1 = city_1;
	}
	public String getAddr_1() {
		return Addr_1;
	}
	public void setAddr_1(String addr_1) {
		Addr_1 = addr_1;
	}
	public void setGetCounty(List<Region> getCounty) {
			this.getCounty = getCounty;
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
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
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
	public HouseSellRent getHsr() {
		return hsr;
	}
	public void setHsr(HouseSellRent hsr) {
		this.hsr = hsr;
	}
	public renthouse getRhouse() {
		return rhouse;
	}
	public void setRhouse(renthouse rhouse) {
		this.rhouse = rhouse;
	}
	public StringBuilder getSth() {
		return sth;
	}
	public void setSth(StringBuilder sth) {
		this.sth = sth;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	//调用多条件
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
			getCounty = rhouse.findCounty(province_1, city_1);
			getOptions();
			return "SUCCESS";
		}catch(Exception e) {
			sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			return "ERROR";
		}
	}
	//reset方法默认按钮
	public String noLimit() throws Exception{
		try {
			price_1=0;
			size_1=0;
			floor_1=0;
			sth.setLength(0);
			sth.append(rhouse.findAll());		
			num=rhouse.getNumber();
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
	
		//面积排序
		public String arraySize()throws Exception{
			try {
				sth.setLength(0);
				sth.append(rhouse.arraySize(hsr));
				num = rhouse.getNumber();
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
				sth.append(rhouse.arrayPrice(hsr));
				num = rhouse.getNumber();
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
	
		//execute调用多条件查询
		public void getOptions()throws Exception{
			try{	
				sth.setLength(0);
				int S[]=new int[2];
				double P[] = new double[2];
				switch(price_1){
				case 1: P[0]=0;P[1]=1000;break;
				case 2: P[0]=1000;P[1]=2000;break;
				case 3: P[0]=2000;P[1]=3000;break;
				case 4: P[0]=3000;P[1]=4000;break;
				case 5: P[0]=4000;P[1]=5000;break;
				case 6: P[0]=4000;P[1]=99999;break;
				default: P[0]=0;P[1]=99999;break;
				
				}
				
				switch(size_1){
				case 1: S[0]=0;S[1]=50; break;
				case 2: S[0]=50;S[1]=100;break;
				case 3: S[0]=100;S[1]=150;break;
				case 4: S[0]=150;S[1]=200;break;
				case 5: S[0]=200;S[1]=99999;break;
				default:  S[0]=0;S[1]=99999;break;
				
				}
				sth.append(rhouse.getOptions(P, S,floor_1, Addr_1));
				num = rhouse.getNumber();
				if(num==0){
				    sth.setLength(0);
					sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			    }
		    }catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");

		}		
	}
}
