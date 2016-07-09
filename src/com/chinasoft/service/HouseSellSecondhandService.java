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
	 * 获取二手房的首页显示信息，4条
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
	 * 鑫神代码
	 * @param HId
	 * @return
	 */
	public HouseSellSecondhand getbyId(Integer HId)
	{
		return houseSellSecondhandDAO.findById(HId);
	}
	
	
}
