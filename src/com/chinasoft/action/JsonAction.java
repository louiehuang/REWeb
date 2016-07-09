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
	private Map<String, Object> dataMap; // �����˺Ų�ѯ�����û�
	private Map<String, Object> dataMap_AllUser; // ��ѯȫ���û�
	private Users user;
	private Users a_user;

	private String UserPassword; // �û����룬�����Աȹ���Ա�Ƿ���û�����������޸�(��a_user.UPwd�Ƚ�)

	private boolean saveUserFlag; // ������־
	private boolean updateUserFlag; // ���±�־
	private boolean deleteUserFlag; // ɾ����־
	private String UId;
	private int pageIndex = 1;
	private int pageSize = 10; // Ĭ�Ϸ�ҳ��С
	private int pageCount = 0;

	private HttpSession session;

	/**
	 * �����û��˺Ų�ѯ�û���Ϣ �û�ע��ʱ����˺��Ƿ�ע�� ����Ա��ѯ�����û���Ϣ
	 * 
	 * @return
	 */
	public String json_findUser() {
		String uAccount = user.getUAccount();
		System.out.println("json_findUserִ��: " + uAccount);

		try {
			dataMap = new HashMap<String, Object>();
			List<Users> list = usersService.findByUAccount(uAccount);

			// ����ע����0����������1
			if (list.size() == 0) {
				dataMap.put("userAccount", "0");
			} else {
				dataMap.put("list", list); // ����Ա��ѯ�û�ʱʹ��
				dataMap.put("userAccount", "1");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "find_success";
	}

	/**
	 * �����û��˺ų��Ե�½
	 * 
	 * @return
	 */
	public String json_loginUser() {
		String uAccount = user.getUAccount();
		String pwd = Encryption.getMD5(user.getUPwd()); // ����
		user.setUPwd(pwd);

		System.out.println("json_loginUserִ��: " + uAccount + ", " + pwd);

		try {
			dataMap = new HashMap<String, Object>();
			List<Users> list = usersService.findByExample(user);

			// ��½��־��userLoginFlagΪ1��ʾ��½ʧ�ܣ�û�ж�Ӧ�˻�
			if (list.size() == 0) {

				dataMap.put("userLoginFlag", "1");
			} else {
				// users����session
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("users", list.get(0));

				dataMap.put("userLoginFlag", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "u_login_success";
	}

	/**
	 * ���¶��û���Ϣ���޸�
	 * 
	 * @return
	 */
	public String json_updateUser() {
		System.out.println("json_updateUserִ��...");

		try {
			// ������Ա�޸������룬������ܽ��м���
			String pwd = a_user.getUPwd();
			System.out.println(UserPassword + ", " + pwd);

			if (pwd.equals(UserPassword)) {
				//������
			} else {
				//����������м���
				pwd = Encryption.getMD5(pwd); // ����
				a_user.setUPwd(pwd);
			}

			System.out.println("json_updateUserִ��: " + a_user.getUId() + ","
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
	 * ����û���Ϣ
	 * @return
	 */
	public String json_saveUser() {
		String uAccount = a_user.getUAccount();
		System.out.println("json_findUserִ��: " + uAccount);
		// ������м���
		String pwd = Encryption.getMD5(a_user.getUPwd()); // ����
		a_user.setUPwd(pwd);

		try {
			saveUserFlag = true;
			System.out.println(saveUserFlag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "saveUser_success";
	}

	/**
	 * ��ѯ�����û�
	 * 
	 * @return
	 */
	public String json_findAllUser() {
		System.out.println("json_findAllUserִ��...");
		try {
			dataMap_AllUser = new HashMap<String, Object>();
			List<Users> list = new ArrayList<Users>();
			list = usersService.findAll();
			// list = cutPage(list, pageIndex, pageSize); // ��ҳ

			/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
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
		// ���ؽ��
		return "findAllUser_success";
	}

	/**
	 * ɾ��ѡ���û�������UIdɾ��
	 * 
	 * @return
	 */
	public String json_deleteUser() {
		System.out.println("json_deleteUserִ��, ɾ�� " + UId);

		try {
			Users user = usersService.findById(Integer.parseInt(UId));
			// System.out.println(user.getUAccount());
			usersService.delete(user);
			// deleteUserFlag = true;

			// ɾ�������ǰ̨�û�����ʾ
			String call = json_findAllUser();
			dataMap_AllUser.put("deleteUser_success", true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
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
