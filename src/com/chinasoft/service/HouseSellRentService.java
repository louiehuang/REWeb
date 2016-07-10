package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellRentDAO;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.Users;

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
	 * 
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
	public List<HouseSellRent> findAll() {
		List<HouseSellRent> list = houseSellRentDAO.findAll();
		return list;
	}

	public String save(HouseSellRent houseSellRent){
		return houseSellRentDAO.save(houseSellRent);
		
	}

	
	public HouseSellRent findById(Integer id) {
		return houseSellRentDAO.findById(id);
	}

	/**
	 * �������
	 * 
	 * @param HId
	 * @return
	 */
	public HouseSellRent getbyid(Integer HId) {
		return houseSellRentDAO.findById(HId);
	}

	public void delete(HouseSellRent house) {
		houseSellRentDAO.delete(house);
	}

	/* ������뿪ʼ */
	// �����ղر��е�HId��CType�ҵ��ղصĳ��ⷿ
	public HouseSellRent getCollectInfo(java.lang.Integer id) {
		return houseSellRentDAO.findById(id);
	}

	// �����û�id�ҵ��û������ķ���
	public List<HouseSellRent> getMyhouseInfo(Users users) {
		List<HouseSellRent> list = houseSellRentDAO.findByUId(users.getUId());
		return list;
	}

	// ɾ���û���ĳ������
	public void deleteHouseSellRent(int HId) {
		HouseSellRent ans = new HouseSellRent();
		ans = houseSellRentDAO.findById(HId);
		houseSellRentDAO.delete(ans);
	}

	// ���ݷ���id�ҵ�������Ϣ
	public HouseSellRent getHouseSellRentInfo(int HId) {
		return houseSellRentDAO.findById(HId);
	}

	/* ���������� */

}
