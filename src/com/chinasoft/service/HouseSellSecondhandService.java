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
	 * 获取二手房的首页显示信息，4条
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
	 * 鑫神代码
	 * 
	 * @param HId
	 * @return
	 */
	public HouseSellSecondhand getbyId(Integer HId) {
		return houseSellSecondhandDAO.findById(HId);
	}

	/* wen */
	// 根据收藏表中的HId和CType找到收藏的二手房
	public HouseSellSecondhand getCollectInfo(java.lang.Integer id) {
		return houseSellSecondhandDAO.findById(id);
	}

	// 根据用户id找到用户发布的房屋
	public List<HouseSellSecondhand> getMyhouseInfo(Users users) {
		List<HouseSellSecondhand> list = houseSellSecondhandDAO.findByUId(users
				.getUId());
		return list;
	}

	// 删除用户的某个发布
	public void deleteHouseSellSecondhand(int HId) {
		HouseSellSecondhand ans = new HouseSellSecondhand();
		ans = houseSellSecondhandDAO.findById(HId);
		houseSellSecondhandDAO.delete(ans);
	}

	// 根据房屋id找到房屋信息
	public HouseSellSecondhand getHouseSellSecondhandInfo(int HId) {
		return houseSellSecondhandDAO.findById(HId);
	}

	/* wen */

}
