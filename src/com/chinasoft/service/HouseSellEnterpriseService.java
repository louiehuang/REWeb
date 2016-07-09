package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellEnterpriseDAO;
import com.chinasoft.pojo.HouseSellEnterprise;

/**
 * ������ҵ�·�Service
 * 
 * @author hlyin
 * 
 */
public class HouseSellEnterpriseService {
	private HouseSellEnterpriseDAO houseSellEnterpriseDAO;

	public HouseSellEnterpriseDAO getHouseSellEnterpriseDAO() {
		return houseSellEnterpriseDAO;
	}

	public void setHouseSellEnterpriseDAO(
			HouseSellEnterpriseDAO houseSellEnterpriseDAO) {
		this.houseSellEnterpriseDAO = houseSellEnterpriseDAO;
	}

	/**
	 * ��ȡ��ҵ�·�����ҳ��ʾ��Ϣ��4��
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellEnterprise> getSellNewInfo() {
		return houseSellEnterpriseDAO.findAll().subList(0, 4);
	}
	
	@SuppressWarnings("unchecked")
	public List<HouseSellEnterprise> findAll() {
		return houseSellEnterpriseDAO.findAll();
	}
	
	public HouseSellEnterprise findById(Integer id){
		return houseSellEnterpriseDAO.findById(id);
	}
	
	/**
	 * �������
	 * @param HId
	 * @return
	 */
	public HouseSellEnterprise getById(Integer HId)
	{
		return houseSellEnterpriseDAO.findById(HId);
	}
	
	public void delete(HouseSellEnterprise house){
		houseSellEnterpriseDAO.delete(house);
	}
	
	
	

}
