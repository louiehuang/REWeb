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
	
	//���ݸ����û�id�ҵ����û�����Ķ����б������·������ַ��ͳ��ⷿ
	public List<Transactions> getBuyTransactions(Users users){
		return transactionsDAO.findByUbuyId(users.getUId());
	}
	
	//���������û�id�ҵ����û�����Ķ����б��������ַ��ͳ��ⷿ
	public List<Transactions> getSellTransactions(Users users){
		return transactionsDAO.findByUsellId(users.getUId());
	}
	
	//������ҵ�û�id�ҵ���ҵ������¥�̶���
	public List<Transactions> getEnterpriseSellTransactions(EnterpriseUsers enterpriseUsers){
		return transactionsDAO.findByUsellId(enterpriseUsers.getUId());
	}
}
