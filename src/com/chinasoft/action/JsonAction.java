package com.chinasoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;
import com.chinasoft.service.UsersService;

public class JsonAction {
	private UsersService usersService;
	private Map<String, Object> dataMap; // 根据账号查询单个用户
	private Map<String, Object> dataMap_AllUser; // 查询全部用户
	private Users user;
	private Users a_user;
	private boolean saveUserFlag; // 新增标志
	private boolean updateUserFlag; // 更新标志
	private boolean deleteUserFlag; // 删除标志
	private String UId;
	private int pageIndex = 1;
	private int pageSize = 10; // 默认分页大小
	private int pageCount = 0;

	/* 查询房屋 */
	private HouseSellRentService houseSellRentService;
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellEnterpriseService houseSellEnterpriseService;

	private Map<String, Object> dataMap_AllHouse;
	private String HId;
	private int house_pageIndex = 1;
	private int house_pageSize = 10; // 默认分页大小
	private int house_pageCount = 0;
	private String house_queryMode;

	/**
	 * 根据用户账号查询用户信息
	 * 
	 * @return
	 */
	public String json_findUser() {
		String uAccount = user.getUAccount();
		System.out.println("json_findUser执行: " + uAccount);

		// ServletRequest request = ServletActionContext.getRequest();
		// uAccount = request.getParameter("uAccount");

		try {
			dataMap = new HashMap<String, Object>();
			// List list = usersService.findByUAccount(uAccount);
			List<Users> list = usersService.findByExample(user);
			dataMap.put("list", list);
			dataMap.put("success_queryUser", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "find_success";
	}

	/**
	 * 更新对用户信息的修改
	 * 
	 * @return
	 */
	public String json_updateUser() {
		try {
			a_user.setUGender((a_user.getUGender().equals("on") ? "男" : "女"));

			System.out.println("json_updateUser执行: " + a_user.getUId() + ","
					+ a_user.getUAccount() + "," + a_user.getUPwd() + ","
					+ a_user.getUName() + "," + a_user.getUGender() + ","
					+ a_user.getUHeader() + "," + a_user.getUCredit() + ","
					+ a_user.getUTele() + "," + a_user.getUEmail());

			usersService.update(a_user);

			updateUserFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * 添加用户信息
	 * 
	 * @return
	 */
	public String json_saveUser() {
		String uAccount = a_user.getUAccount();
		System.out.println("json_findUser执行: " + uAccount);

		try {
			saveUserFlag = true;
			System.out.println(saveUserFlag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "saveUser_success";
	}

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public String json_findAllUser() {
		System.out.println("json_findAllUser执行...");
		try {
			dataMap_AllUser = new HashMap<String, Object>();
			List<Users> list = new ArrayList<Users>();
			list = usersService.findAll();
			list = cutPage(list, pageIndex, pageSize); // 分页

			dataMap_AllUser.put("list", list);
			dataMap_AllUser.put("pageIndex", pageIndex);
			dataMap_AllUser.put("pageSize", pageSize);
			dataMap_AllUser.put("pageCount", pageCount);

			// dataMap_AllUser.put("success_queryAllUser", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "findAllUser_success";
	}

	/**
	 * 根据当前所在页 和 每页大小进行分页
	 * 
	 * @param list
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Users> cutPage(List<Users> list, int pageIndex, int pageSize) {
		List<Users> newList = new ArrayList<Users>();
		if (list != null) {
			if (list.size() % pageSize == 0) {
				pageCount = list.size() / pageSize;
			} else {
				pageCount = list.size() / pageSize + 1;
			}

			int start = (pageIndex - 1) * pageSize;
			int end = pageIndex * pageSize;
			if (end > list.size()) {
				end = list.size();
			}

			for (int i = start; i < end; i++) {
				newList.add(list.get(i));
			}
		}
		return newList;
	}

	/**
	 * 删除选中用户，根据UId删除
	 * 
	 * @return
	 */
	public String json_deleteUser() {
		System.out.println("json_deleteUser执行, 删除 " + UId);

		try {
			Users user = usersService.findById(Integer.parseInt(UId));
			// System.out.println(user.getUAccount());
			usersService.delete(user);
			// deleteUserFlag = true;

			// 删除后更新前台用户表显示
			String call = json_findAllUser();
			dataMap_AllUser.put("deleteUser_success", true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "deleteUser_success";
	}

	public String json_queryAllHouse() {
		System.out.println("json_queryAllHouse执行, 查询:" + house_queryMode);
		/* 判断查询类型 */

		try {
			dataMap_AllHouse = new HashMap<String, Object>();

			if (house_queryMode.equals("HouseSellEnterprise")) {
				List<HouseSellEnterprise> enterList = houseSellEnterpriseService
						.findAll();
				dataMap_AllHouse.put("enterList", enterList);
			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				List<HouseSellSecondhand> secondList = houseSellSecondhandService
						.findAll();
				dataMap_AllHouse.put("secondList", secondList);
			} else if (house_queryMode.equals("HouseSellRent")) {
				List<HouseSellRent> rentList = houseSellRentService.findAll();
				// rentList = cutPage(list, house_pageIndex, house_pageSize); //分页
				dataMap_AllHouse.put("rentList", rentList);

			}

			dataMap_AllHouse.put("house_pageIndex", house_pageIndex);
			dataMap_AllHouse.put("house_pageSize", house_pageSize);
			dataMap_AllHouse.put("house_pageCount", house_pageCount);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 返回结果
		return "findAllHouse_success";
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public Map<String, Object> getDataMap_AllUser() {
		return dataMap_AllUser;
	}

	public void setDataMap_AllUser(Map<String, Object> dataMap_AllUser) {
		this.dataMap_AllUser = dataMap_AllUser;
	}

	public boolean isSaveUserFlag() {
		return saveUserFlag;
	}

	public void setSaveUserFlag(boolean saveUserFlag) {
		this.saveUserFlag = saveUserFlag;
	}

	public boolean isUpdateUserFlag() {
		return updateUserFlag;
	}

	public void setUpdateUserFlag(boolean updateUserFlag) {
		this.updateUserFlag = updateUserFlag;
	}

	public boolean isDeleteUserFlag() {
		return deleteUserFlag;
	}

	public void setDeleteUserFlag(boolean deleteUserFlag) {
		this.deleteUserFlag = deleteUserFlag;
	}

	public String getUId() {
		return UId;
	}

	public void setUId(String uId) {
		UId = uId;
	}

	public Users getA_user() {
		return a_user;
	}

	public void setA_user(Users a_user) {
		this.a_user = a_user;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public Map<String, Object> getDataMap_AllHouse() {
		return dataMap_AllHouse;
	}

	public void setDataMap_AllHouse(Map<String, Object> dataMap_AllHouse) {
		this.dataMap_AllHouse = dataMap_AllHouse;
	}

	public String getHId() {
		return HId;
	}

	public void setHId(String hId) {
		HId = hId;
	}

	public int getHouse_pageIndex() {
		return house_pageIndex;
	}

	public void setHouse_pageIndex(int house_pageIndex) {
		this.house_pageIndex = house_pageIndex;
	}

	public int getHouse_pageSize() {
		return house_pageSize;
	}

	public void setHouse_pageSize(int house_pageSize) {
		this.house_pageSize = house_pageSize;
	}

	public int getHouse_pageCount() {
		return house_pageCount;
	}

	public void setHouse_pageCount(int house_pageCount) {
		this.house_pageCount = house_pageCount;
	}

	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}

	public void setHouseSellRentService(
			HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}

	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}

	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}

	public String getHouse_queryMode() {
		return house_queryMode;
	}

	public void setHouse_queryMode(String house_queryMode) {
		this.house_queryMode = house_queryMode;
	}

	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}

	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}

	// public Map<String, Object> json_Test() {
	// try {
	// dataMap = new HashMap<String, Object>();
	// List list = usersService.findByUAccount("test");
	// dataMap.put("list", list);
	// dataMap.put("success", true);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// // 返回结果
	// return dataMap;
	// }

}
