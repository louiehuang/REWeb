package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellSecondhandDAO;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Users;

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
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellSecondhand> getSellOldInfo() {
		return houseSellSecondhandDAO.findAll().subList(0, 4);
	}

	@SuppressWarnings("unchecked")
	public List<HouseSellSecondhand> findAll() {
		return houseSellSecondhandDAO.findAll();
	}

	public HouseSellSecondhand findById(Integer id) {
		return houseSellSecondhandDAO.findById(id);
	}

	public void delete(HouseSellSecondhand house) {
		houseSellSecondhandDAO.delete(house);
	}

	/**
	 * �������
	 * 
	 * @param HId
	 * @return
	 */
	public HouseSellSecondhand getbyId(Integer HId) {
		return houseSellSecondhandDAO.findById(HId);
	}

	/* wen */
	// �����ղر��е�HId��CType�ҵ��ղصĶ��ַ�
	public HouseSellSecondhand getCollectInfo(java.lang.Integer id) {
		return houseSellSecondhandDAO.findById(id);
	}

	// �����û�id�ҵ��û������ķ���
	public List<HouseSellSecondhand> getMyhouseInfo(Users users) {
		List<HouseSellSecondhand> list = houseSellSecondhandDAO.findByUId(users
				.getUId());
		return list;
	}

	// ɾ���û���ĳ������
	public void deleteHouseSellSecondhand(int HId) {
		HouseSellSecondhand ans = new HouseSellSecondhand();
		ans = houseSellSecondhandDAO.findById(HId);
		houseSellSecondhandDAO.delete(ans);
	}

	// ���ݷ���id�ҵ�������Ϣ
	public HouseSellSecondhand getHouseSellSecondhandInfo(int HId) {
		return houseSellSecondhandDAO.findById(HId);
	}

	/* wen */

}
