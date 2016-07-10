package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.TransactionsDAO;
import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.Transactions;
import com.chinasoft.pojo.Users;

public class TransactionsService {
	private TransactionsDAO transactionsDAO;

	public TransactionsDAO getTransactionsDAO() {
		return transactionsDAO;
	}

	public void setTransactionsDAO(TransactionsDAO transactionsDAO) {
		this.transactionsDAO = transactionsDAO;
	}
	
	//根据个人用户id找到该用户买过的订单列表，包括新房、二手房和出租房
	public List<Transactions> getBuyTransactions(Users users){
		return transactionsDAO.findByUbuyId(users.getUId());
	}
	
	//根据卖家用户id找到该用户买过的订单列表，包括二手房和出租房
	public List<Transactions> getSellTransactions(Users users){
		return transactionsDAO.findByUsellId(users.getUId());
	}
	
	//根据企业用户id找到企业卖出的楼盘订单
	public List<Transactions> getEnterpriseSellTransactions(EnterpriseUsers enterpriseUsers){
		return transactionsDAO.findByUsellId(enterpriseUsers.getUId());
	}
}
