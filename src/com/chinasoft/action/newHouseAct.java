package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.Region;
import com.chinasoft.service.newhouse;


public class newHouseAct {
	private newhouse nhouse;
	private HouseSellEnterprise hse;
	private Region region;
	private StringBuilder sth = new StringBuilder();
	private int num;
	private String Addr;
	private int size;
	private int price;
	private int type;
	private String province;
	private String city;
	private String county;	
	private List<Region> getCounty;
	//保存每次传过来的值
	private int price_1 = 0;
	private int size_1 = 0;
	private int type_1 = 0;
	private String county_1;
	private String province_1="湖北省" ;
	private String city_1="武汉市";
	private String Addr_1;
	
	//set get
	
	
	public String getCounty() {
		return county;
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
	public String getCounty_1() {
		return county_1;
	}
	public void setCounty_1(String county_1) {
		this.county_1 = county_1;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
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
	public List<Region> getGetCounty() {
		return getCounty;
	}
	public void setGetCounty(List<Region> getCounty) {
		this.getCounty = getCounty;
	}
	public String getAddr_1() {
		return Addr_1;
	}
	public void setAddr_1(String addr_1) {
		Addr_1 = addr_1;
	}
	public int getType_1() {
		return type_1;
	}
	public void setType_1(int type_1) {
		this.type_1 = type_1;
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
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public StringBuilder getSth() {
		return sth;
	}
	public void setSth(StringBuilder sth) {
		this.sth = sth;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public HouseSellEnterprise getHse() {
		return hse;
	}
	public void setHse(HouseSellEnterprise hse) {
		this.hse = hse;
	}
	public newhouse getNhouse() {
		return nhouse;
	}
	public void setNhouse(newhouse nhouse) {

		this.nhouse = nhouse;
	}
	
//调用多条件默认执行
	
	public String execute()throws Exception{
		try{
			sth.setLength(0);
			num=0;
			city_1="武汉市";
			province_1="湖北省";
            size_1 = 0;
			price_1 = 0;
			type_1 = 0;
			size_1 = size;
			price_1 = price;
			type_1 = type;
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
			getCounty = nhouse.findCounty(province_1, city_1);
			getOptions();
			return "SUCCESS";
		
		}catch(Exception e) {
			sth.append("<div align='center'><img  src='images/findnothing.png'  /></div>");
			return "ERROR";
		}
		
	}	

	//默认
	public String noLimit() throws Exception{
		try {
			price_1=0;
			size_1=0;
			type_1=0;
			sth.setLength(0);
			sth.append(nhouse.findAll());		
			num=nhouse.getNumber();
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
				sth.append(nhouse.arraySize(hse));
				num = nhouse.getNumber();
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
				sth.append(nhouse.arrayPrice(hse));
				num = nhouse.getNumber();
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
		
		//多条件查询，在execute里面直接调用
		public void getOptions()throws Exception{
			try{	
				sth.setLength(0);
				num=0;
				int S[]=new int[2];
				double P[] = new double[2];
				String T = new String();
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
				
				switch(type_1){
				case 0: T="不限"; break;
				case 1: T="1室0厅"; break;
				case 2: T="1室1厅";break;
				case 3: T="2室1厅";break;
				case 4: T="3室1厅";break;
				case 5: T="3室2厅";break;
				default: T="不限";  break;
				}
				sth.append(nhouse.getOption(P, S, Addr_1, T));
				 nhouse.getNumber();
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
}