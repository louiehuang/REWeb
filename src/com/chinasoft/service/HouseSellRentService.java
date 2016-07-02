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
	 * 获取房屋出租信息供首页显示，4条
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellRent> getRentInfo() {
		List<HouseSellRent> list = houseSellRentDAO.findAll();
		// int length = list.size();
		// return list.subList(length - 4, length); //返回最后4条
		return list.subList(0, 4); // 返回前4条
	}

}
