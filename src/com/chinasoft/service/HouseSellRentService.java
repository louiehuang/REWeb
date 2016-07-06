package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellRentDAO;
import com.chinasoft.pojo.HouseSellRent;

public class HouseSellRentService {
	private HouseSellRentDAO houseSellRentDAO;

	public HouseSellRentDAO getHouseSellRentDAO() {
		return houseSellRentDAO;
	}

	public void setHouseSellRentDAO(HouseSellRentDAO houseSellRentDAO) {
		this.houseSellRentDAO = houseSellRentDAO;
	}

	/**
	 * ��ȡ���ݳ�����Ϣ����ҳ��ʾ��4��
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellRent> getRentInfo() {
		List<HouseSellRent> list = houseSellRentDAO.findAll();
		// int length = list.size();
		// return list.subList(length - 4, length); //�������4��
		return list.subList(0, 4); // ����ǰ4��
	}
	
	@SuppressWarnings("unchecked")
	public List<HouseSellRent> findAll(){
		List<HouseSellRent> list = houseSellRentDAO.findAll();
		return list;
	}
	
	public HouseSellRent findById(Integer id){
		return houseSellRentDAO.findById(id);
	}
	
	public void delete(HouseSellRent house){
		houseSellRentDAO.delete(house);
	}

	

}
