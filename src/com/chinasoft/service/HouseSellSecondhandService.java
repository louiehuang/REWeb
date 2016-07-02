package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellSecondhandDAO;
import com.chinasoft.pojo.HouseSellSecondhand;

public class HouseSellSecondhandService {
	private HouseSellSecondhandDAO houseSellSecondhandDAO;

	public HouseSellSecondhandDAO getHouseSellSecondhandDAO() {
		return houseSellSecondhandDAO;
	}

	public void setHouseSellSecondhandDAO(
			HouseSellSecondhandDAO houseSellSecondhandDAO) {
		this.houseSellSecondhandDAO = houseSellSecondhandDAO;
	}

	/**
	 * ��ȡ���ַ�����ҳ��ʾ��Ϣ��4��
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellSecondhand> getSellOldInfo() {
		return houseSellSecondhandDAO.findAll();
		// return houseSellSecondhandDAO.getSellOldInfo();
	}

}
