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
	 * 获取房屋出租信息供首页显示，4条
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellRent> getRentInfo() {
		List<HouseSellRent> list = houseSellRentDAO.findAll();
		// int length = list.size();
		// return list.subList(length - 4, length); //返回最后4条
		return list.subList(0, 4); // 返回前4条
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
	 * 鑫神代码
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

	/* 雯神代码开始 */
	// 根据收藏表中的HId和CType找到收藏的出租房
	public HouseSellRent getCollectInfo(java.lang.Integer id) {
		return houseSellRentDAO.findById(id);
	}

	// 根据用户id找到用户发布的房屋
	public List<HouseSellRent> getMyhouseInfo(Users users) {
		List<HouseSellRent> list = houseSellRentDAO.findByUId(users.getUId());
		return list;
	}

	// 删除用户的某个发布
	public void deleteHouseSellRent(int HId) {
		HouseSellRent ans = new HouseSellRent();
		ans = houseSellRentDAO.findById(HId);
		houseSellRentDAO.delete(ans);
	}

	// 根据房屋id找到房屋信息
	public HouseSellRent getHouseSellRentInfo(int HId) {
		return houseSellRentDAO.findById(HId);
	}

	/* 雯神代码结束 */

}
