package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;

/**
 * 首页Action<br/>
 * 加载首页显示的信息<br/>
 * 每次加载首页时调用LoadInfo()方法<br/>
 * @author hlyin
 *
 */
public class IndexAction {
	static int i = 1;

	/**
	 * 出租房屋服务
	 */
	private HouseSellRentService houseSellRentService;

	/**
	 * 企业新房服务
	 */
	private HouseSellEnterpriseService houseSellEnterpriseService;

	/**
	 * 出售二手房服务
	 */
	private HouseSellSecondhandService houseSellSecondhandService;

	/**
	 * 首页出租信息列表
	 */
	private List<HouseSellRent> houseSellRentList;

	/**
	 * 首页企业楼盘信息列表
	 */
	private List<HouseSellEnterprise> houseSellEnterpriseList;

	/**
	 * 首页出售二手房信息列表
	 */
	private List<HouseSellSecondhand> houseSellSecondhandList;

	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}

	public void setHouseSellRentService(
			HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}

	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}

	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}

	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}

	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}

	public List<HouseSellRent> getHouseSellRentList() {
		return houseSellRentList;
	}

	public void setHouseSellRentList(List<HouseSellRent> houseSellRentList) {
		this.houseSellRentList = houseSellRentList;
	}

	public List<HouseSellEnterprise> getHouseSellEnterpriseList() {
		return houseSellEnterpriseList;
	}

	public void setHouseSellEnterpriseList(
			List<HouseSellEnterprise> houseSellEnterpriseList) {
		this.houseSellEnterpriseList = houseSellEnterpriseList;
	}

	public List<HouseSellSecondhand> getHouseSellSecondhandList() {
		return houseSellSecondhandList;
	}

	public void setHouseSellSecondhandList(
			List<HouseSellSecondhand> houseSellSecondhandList) {
		this.houseSellSecondhandList = houseSellSecondhandList;
	}

	/**
	 * 加载首页的房屋信息：
	 * 出租房屋、企业新房、出售二手房
	 * @return
	 */
	public String LoadInfo() {
		try {
			System.out.println("LoadInfo执行...");
			// 房屋出租信息
			houseSellRentList = houseSellRentService.getRentInfo();

			// 新房出售信息
			houseSellEnterpriseList = houseSellEnterpriseService.getSellNewInfo();

			// 二手房出售信息
			houseSellSecondhandList = houseSellSecondhandService.getSellOldInfo();

			// System.out.println("第" + i + "次完成加载信息");
			// i++;
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}

		return "success";
	}

	
	/**
	 * 企业新房获取测试
	 * 
	 * @return
	 */
	public List<HouseSellEnterprise> Test1() {
		return houseSellEnterpriseService.getSellNewInfo();
	}

	public List<HouseSellRent> Test2() {
		return houseSellRentService.getRentInfo();
	}


}
