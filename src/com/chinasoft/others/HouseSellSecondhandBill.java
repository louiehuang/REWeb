package com.chinasoft.others;

import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Transactions;
import com.chinasoft.pojo.Users;

public class HouseSellSecondhandBill {
	private Users uBuyUsers;
	private Users uSellUsers;
	private Transactions transactions;
	private HouseSellSecondhand houseSellSecondhand;
	
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
	public HouseSellSecondhand getHouseSellSecondhand() {
		return houseSellSecondhand;
	}
	public void setHouseSellSecondhand(HouseSellSecondhand houseSellSecondhand) {
		this.houseSellSecondhand = houseSellSecondhand;
	}
	
}
