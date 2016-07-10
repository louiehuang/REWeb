package com.chinasoft.others;

import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.Transactions;
import com.chinasoft.pojo.Users;

public class HouseSellEnterpriseBill {
	private Users uBuyUsers;
	private EnterpriseUsers uSellEnterpriseUsers;
	private Transactions transactions;
	private HouseSellEnterprise houseSellEnterprise;
	
	
	public Users getuBuyUsers() {
		return uBuyUsers;
	}
	public void setuBuyUsers(Users uBuyUsers) {
		this.uBuyUsers = uBuyUsers;
	}
	public EnterpriseUsers getuSellEnterpriseUsers() {
		return uSellEnterpriseUsers;
	}
	public void setuSellEnterpriseUsers(EnterpriseUsers uSellEnterpriseUsers) {
		this.uSellEnterpriseUsers = uSellEnterpriseUsers;
	}
	public Transactions getTransactions() {
		return transactions;
	}
	public void setTransactions(Transactions transactions) {
		this.transactions = transactions;
	}
	public HouseSellEnterprise getHouseSellEnterprise() {
		return houseSellEnterprise;
	}
	public void setHouseSellEnterprise(HouseSellEnterprise houseSellEnterprise) {
		this.houseSellEnterprise = houseSellEnterprise;
	}
	
}
