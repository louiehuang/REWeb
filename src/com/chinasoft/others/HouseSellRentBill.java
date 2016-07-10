package com.chinasoft.others;

import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.Transactions;
import com.chinasoft.pojo.Users;

public class HouseSellRentBill {
	private Users uBuyUsers;
	private Users uSellUsers;
	private Transactions transactions;
	private HouseSellRent houseSellRent;
	
	public Users getuBuyUsers() {
		return uBuyUsers;
	}
	public void setuBuyUsers(Users uBuyUsers) {
		this.uBuyUsers = uBuyUsers;
	}
	public Users getuSellUsers() {
		return uSellUsers;
	}
	public void setuSellUsers(Users uSellUsers) {
		this.uSellUsers = uSellUsers;
	}
	public Transactions getTransactions() {
		return transactions;
	}
	public void setTransactions(Transactions transactions) {
		this.transactions = transactions;
	}
	public HouseSellRent getHouseSellRent() {
		return houseSellRent;
	}
	public void setHouseSellRent(HouseSellRent houseSellRent) {
		this.houseSellRent = houseSellRent;
	}
	
}
