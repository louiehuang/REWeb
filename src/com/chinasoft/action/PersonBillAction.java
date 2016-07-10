package com.chinasoft.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.others.HouseSellEnterpriseBill;
import com.chinasoft.others.HouseSellRentBill;
import com.chinasoft.others.HouseSellSecondhandBill;
import com.chinasoft.pojo.Transactions;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.EnterpriseUsersService;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;
import com.chinasoft.service.TransactionsService;
import com.chinasoft.service.UsersService;

public class PersonBillAction {
	private TransactionsService transactionsService;
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellRentService houseSellRentService;
	private EnterpriseUsersService enterpriseUsersService;
	private UsersService usersService;
	
	List<HouseSellEnterpriseBill> houseSellEnterpriseBillBuyList;
	List<HouseSellSecondhandBill> houseSellSecondhandBillBuyList;
	List<HouseSellSecondhandBill> houseSellSecondhandBillSellList;
	List<HouseSellRentBill> houseSellRentBillBuyList;
	List<HouseSellRentBill> houseSellRentBillSellList;
	
	List<Transactions> houseMyBuyList;
	List<Transactions> houseMySellList;
	
	public TransactionsService getTransactionsService() {
		return transactionsService;
	}



	public void setTransactionsService(TransactionsService transactionsService) {
		this.transactionsService = transactionsService;
	}



	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}



	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}



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



	public EnterpriseUsersService getEnterpriseUsersService() {
		return enterpriseUsersService;
	}



	public void setEnterpriseUsersService(
			EnterpriseUsersService enterpriseUsersService) {
		this.enterpriseUsersService = enterpriseUsersService;
	}



	public UsersService getUsersService() {
		return usersService;
	}



	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}



	public List<HouseSellEnterpriseBill> getHouseSellEnterpriseBillBuyList() {
		return houseSellEnterpriseBillBuyList;
	}



	public void setHouseSellEnterpriseBillBuyList(
			List<HouseSellEnterpriseBill> houseSellEnterpriseBillBuyList) {
		this.houseSellEnterpriseBillBuyList = houseSellEnterpriseBillBuyList;
	}



	public List<HouseSellSecondhandBill> getHouseSellSecondhandBillBuyList() {
		return houseSellSecondhandBillBuyList;
	}



	public void setHouseSellSecondhandBillBuyList(
			List<HouseSellSecondhandBill> houseSellSecondhandBillBuyList) {
		this.houseSellSecondhandBillBuyList = houseSellSecondhandBillBuyList;
	}



	public List<HouseSellSecondhandBill> getHouseSellSecondhandBillSellList() {
		return houseSellSecondhandBillSellList;
	}



	public void setHouseSellSecondhandBillSellList(
			List<HouseSellSecondhandBill> houseSellSecondhandBillSellList) {
		this.houseSellSecondhandBillSellList = houseSellSecondhandBillSellList;
	}



	public List<HouseSellRentBill> getHouseSellRentBillBuyList() {
		return houseSellRentBillBuyList;
	}



	public void setHouseSellRentBillBuyList(
			List<HouseSellRentBill> houseSellRentBillBuyList) {
		this.houseSellRentBillBuyList = houseSellRentBillBuyList;
	}



	public List<HouseSellRentBill> getHouseSellRentBillSellList() {
		return houseSellRentBillSellList;
	}



	public void setHouseSellRentBillSellList(
			List<HouseSellRentBill> houseSellRentBillSellList) {
		this.houseSellRentBillSellList = houseSellRentBillSellList;
	}



	public List<Transactions> getHouseMyBuyList() {
		return houseMyBuyList;
	}



	public void setHouseMyBuyList(List<Transactions> houseMyBuyList) {
		this.houseMyBuyList = houseMyBuyList;
	}



	public List<Transactions> getHouseMySellList() {
		return houseMySellList;
	}



	public void setHouseMySellList(List<Transactions> houseMySellList) {
		this.houseMySellList = houseMySellList;
	}



	public String LoadBillInfo(){
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			houseSellEnterpriseBillBuyList = new ArrayList<HouseSellEnterpriseBill>();
			houseSellSecondhandBillBuyList = new ArrayList<HouseSellSecondhandBill>();
			houseSellSecondhandBillSellList = new ArrayList<HouseSellSecondhandBill>();
			houseSellRentBillBuyList = new ArrayList<HouseSellRentBill>();
			houseSellRentBillSellList = new ArrayList<HouseSellRentBill>();
			houseMyBuyList = transactionsService.getBuyTransactions((Users) session1.getAttribute("users"));
			houseMySellList = transactionsService.getSellTransactions((Users) session1.getAttribute("users"));
			for(int i = 0; i < houseMyBuyList.size(); i++){
				if(houseMyBuyList.get(i).getTransType().equals(1)){//买入新房
					HouseSellEnterpriseBill hseb = new HouseSellEnterpriseBill();
					hseb.setTransactions(houseMyBuyList.get(i));
					hseb.setuBuyUsers((Users) session1.getAttribute("users"));
					hseb.setuSellEnterpriseUsers(enterpriseUsersService.getEnterpriseUsersInfo(houseMyBuyList.get(i).getUsellId()));
					hseb.setHouseSellEnterprise(houseSellEnterpriseService.getHouseSellEnterpriseInfo(houseMyBuyList.get(i).getHId()));
					houseSellEnterpriseBillBuyList.add(hseb);
				} else if(houseMyBuyList.get(i).getTransType().equals(2)){//买入二手房
					HouseSellSecondhandBill hssb = new HouseSellSecondhandBill();
					hssb.setTransactions(houseMyBuyList.get(i));
					hssb.setuBuyUsers((Users) session1.getAttribute("users"));
					hssb.setuSellUsers(usersService.getUsersInfo(houseMyBuyList.get(i).getUsellId()));
					hssb.setHouseSellSecondhand(houseSellSecondhandService.getHouseSellSecondhandInfo(houseMyBuyList.get(i).getHId()));
					houseSellSecondhandBillBuyList.add(hssb);
				} else if(houseMyBuyList.get(i).getTransType().equals(3)){//租入出租房
					HouseSellRentBill hsrb = new HouseSellRentBill();
					hsrb.setTransactions(houseMyBuyList.get(i));
					hsrb.setuBuyUsers((Users) session1.getAttribute("users"));
					hsrb.setuSellUsers(usersService.getUsersInfo(houseMyBuyList.get(i).getUsellId()));
					hsrb.setHouseSellRent(houseSellRentService.getHouseSellRentInfo(houseMyBuyList.get(i).getHId()));
					houseSellRentBillBuyList.add(hsrb);
				}
			}
			for(int i = 0; i < houseMySellList.size(); i++){
				if(houseMySellList.get(i).getTransType().equals(2)){
					HouseSellSecondhandBill hssbs = new HouseSellSecondhandBill();
					hssbs.setTransactions(houseMySellList.get(i));
					hssbs.setuSellUsers((Users) session1.getAttribute("users"));
					hssbs.setuBuyUsers(usersService.getUsersInfo(houseMySellList.get(i).getUbuyId()));
					hssbs.setHouseSellSecondhand(houseSellSecondhandService.getHouseSellSecondhandInfo(houseMySellList.get(i).getHId()));
					houseSellSecondhandBillSellList.add(hssbs);
				} else if(houseMySellList.get(i).getTransType().equals(3)){
					HouseSellRentBill hsrbs = new HouseSellRentBill();
					hsrbs.setTransactions(houseMySellList.get(i));
					hsrbs.setuSellUsers((Users) session1.getAttribute("users"));
					hsrbs.setuBuyUsers(usersService.getUsersInfo(houseMySellList.get(i).getUbuyId()));
					hsrbs.setHouseSellRent(houseSellRentService.getHouseSellRentInfo(houseMySellList.get(i).getHId()));
					houseSellRentBillSellList.add(hsrbs);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return "success";
	}
	
}
