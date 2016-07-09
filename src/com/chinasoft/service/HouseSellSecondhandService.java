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
		return houseSellSecondhandDAO.findAll().subList(0, 4);
		// return houseSellSecondhandDAO.getSellOldInfo();
	}
	
	@SuppressWarnings("unchecked")
	public List<HouseSellSecondhand> findAll() {
		return houseSellSecondhandDAO.findAll();
	}
	

	public HouseSellSecondhand findById(Integer id){
		return houseSellSecondhandDAO.findById(id);
	}
	
	public void delete(HouseSellSecondhand house){
		houseSellSecondhandDAO.delete(house);
	}

	/**
	 * �������
	 * @param HId
	 * @return
	 */
	public HouseSellSecondhand getbyId(Integer HId)
	{
		return houseSellSecondhandDAO.findById(HId);
	}
	
	
}
