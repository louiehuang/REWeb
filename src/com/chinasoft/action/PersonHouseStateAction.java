package com.chinasoft.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;


public class PersonHouseStateAction {
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellRentService houseSellRentService;
	
	List<HouseSellSecondhand>houseSellSecondhandList;
	List<HouseSellRent>houseSellRentList;
	
	private String delMyHouseSellSecondhand;
	private String delMyHouseSellRent;
	
	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}
	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}
	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}
	public void setHouseSellRentService(HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}
	
	public List<HouseSellSecondhand> getHouseSellSecondhandList() {
		return houseSellSecondhandList;
	}
	public void setHouseSellSecondhandList(
			List<HouseSellSecondhand> houseSellSecondhandList) {
		this.houseSellSecondhandList = houseSellSecondhandList;
	}
	public List<HouseSellRent> getHouseSellRentList() {
		return houseSellRentList;
	}
	public void setHouseSellRentList(List<HouseSellRent> houseSellRentList) {
		this.houseSellRentList = houseSellRentList;
	}
	
	
	
	public String getDelMyHouseSellSecondhand() {
		return delMyHouseSellSecondhand;
	}
	public void setDelMyHouseSellSecondhand(String delMyHouseSellSecondhand) {
		this.delMyHouseSellSecondhand = delMyHouseSellSecondhand;
	}
	public String getDelMyHouseSellRent() {
		return delMyHouseSellRent;
	}
	public void setDelMyHouseSellRent(String delMyHouseSellRent) {
		this.delMyHouseSellRent = delMyHouseSellRent;
	}
	public String LoadHouseStateInfo(){
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			houseSellSecondhandList = houseSellSecondhandService.getMyhouseInfo((Users) session1.getAttribute("users"));
			houseSellRentList = houseSellRentService.getMyhouseInfo((Users) session1.getAttribute("users"));
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return "success";
	}
	
	public String deleteHouseSellSecondhand(){
		try{
			houseSellSecondhandService.deleteHouseSellSecondhand(Integer.parseInt(delMyHouseSellSecondhand));
		}catch(Exception e){
			System.out.println(e);
			return "error";
		}
		return LoadHouseStateInfo();
	}
	
	public String deleteHouseSellRent(){
		try{
			//System.out.print("deleteHouseSellRent"+"   "+delMyHouseSellRent);
			
			houseSellRentService.deleteHouseSellRent(Integer.parseInt(delMyHouseSellRent));
			//System.out.print("deleteHouseSellRent1");
		}catch(Exception e){
			System.out.println(e);
			return "error";
		}
		return LoadHouseStateInfo();
	}
	
}
