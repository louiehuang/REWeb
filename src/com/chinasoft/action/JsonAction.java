package com.chinasoft.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;

public class JsonAction {
	private UsersService usersService;
	private Map<String, Object> dataMap;
	private Users user;
	private Users a_user;
	private boolean saveFlag;
	private boolean updateFlag;

	public boolean isUpdateFlag() {
		return updateFlag;
	}

	public void setUpdateFlag(boolean updateFlag) {
		this.updateFlag = updateFlag;
	}

	public boolean isSaveFlag() {
		return saveFlag;
	}

	public void setSaveFlag(boolean saveFlag) {
		this.saveFlag = saveFlag;
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

			updateFlag = true;
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
			saveFlag = true;
			System.out.println(saveFlag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "save_success";
	}

	public Map<String, Object> json_Test() {
		try {
			dataMap = new HashMap<String, Object>();
			List list = usersService.findByUAccount("test");
			dataMap.put("list", list);
			dataMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return dataMap;
	}

}
