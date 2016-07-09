package com.chinasoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;
import com.chinasoft.util.Encryption;
import com.chinasoft.util.PageMan;

public class JsonAction {
	private UsersService usersService;
	private Map<String, Object> dataMap; // 根据账号查询单个用户
	private Map<String, Object> dataMap_AllUser; // 查询全部用户
	private Users user;
	private Users a_user;

	private String UserPassword; // 用户密码，用来对比管理员是否对用户密码进行了修改(和a_user.UPwd比较)

	private boolean saveUserFlag; // 新增标志
	private boolean updateUserFlag; // 更新标志
	private boolean deleteUserFlag; // 删除标志
	private String UId;
	private int pageIndex = 1;
	private int pageSize = 10; // 默认分页大小
	private int pageCount = 0;

	private HttpSession session;

	/**
	 * 根据用户账号查询用户信息 用户注册时检测账号是否被注册 管理员查询单个用户信息
	 * 
	 * @return
	 */
	public String json_findUser() {
		String uAccount = user.getUAccount();
		System.out.println("json_findUser执行: " + uAccount);

		try {
			dataMap = new HashMap<String, Object>();
			List<Users> list = usersService.findByUAccount(uAccount);

			// 可以注册置0，不可以置1
			if (list.size() == 0) {
				dataMap.put("userAccount", "0");
			} else {
				dataMap.put("list", list); // 管理员查询用户时使用
				dataMap.put("userAccount", "1");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "find_success";
	}

	/**
	 * 根据用户账号尝试登陆
	 * 
	 * @return
	 */
	public String json_loginUser() {
		String uAccount = user.getUAccount();
		String pwd = Encryption.getMD5(user.getUPwd()); // 加密
		user.setUPwd(pwd);

		System.out.println("json_loginUser执行: " + uAccount + ", " + pwd);

		try {
			dataMap = new HashMap<String, Object>();
			List<Users> list = usersService.findByExample(user);

			// 登陆标志，userLoginFlag为1表示失败
			if (list.size() == 0) {

				dataMap.put("userLoginFlag", "1");
			} else {
				// users存入session
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("users", list.get(0));

				dataMap.put("userLoginFlag", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "u_login_success";
	}

	/**
	 * 更新对用户信息的修改
	 * 
	 * @return
	 */
	public String json_updateUser() {
		System.out.println("json_updateUser执行...");

		try {
			// 若管理员修改了密码，则对新密进行加密
			String pwd = a_user.getUPwd();
			System.out.println(UserPassword + ", " + pwd);

			if (pwd.equals(UserPassword)) {
				//不处理
			} else {
				//对新密码进行加密
				pwd = Encryption.getMD5(pwd); // 加密
				a_user.setUPwd(pwd);
			}

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
		// 密码进行加密
		String pwd = Encryption.getMD5(a_user.getUPwd()); // 加密
		a_user.setUPwd(pwd);

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
			// list = cutPage(list, pageIndex, pageSize); // 分页

			/* 分页，接收分页后list和分页页数 */
			Map<String, Object> tmp = PageMan.cutUserPage(list, pageIndex,
					pageSize);

			dataMap_AllUser.put("list", tmp.get("newList"));
			dataMap_AllUser.put("pageCount", tmp.get("pageCount"));

			dataMap_AllUser.put("pageIndex", pageIndex);
			dataMap_AllUser.put("pageSize", pageSize);

			// dataMap_AllUser.put("success_queryAllUser", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "findAllUser_success";
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

	public String getUserPassword() {
		return UserPassword;
	}

	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}

}
