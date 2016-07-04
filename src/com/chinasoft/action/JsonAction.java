package com.chinasoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;

public class JsonAction {
	private UsersService usersService;
	private Map<String, Object> dataMap; //�����˺Ų�ѯ�����û�
	private Map<String, Object> dataMap_AllUser; //��ѯȫ���û�
	private Users user;
	private Users a_user;
	private boolean saveFlag; //������־
	private boolean updateFlag; //���±�־

	private int pageIndex = 1;
	private int pageSize = 10; //Ĭ�Ϸ�ҳ��С
	private int pageCount = 0;

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
	 * �����û��˺Ų�ѯ�û���Ϣ
	 * 
	 * @return
	 */
	public String json_findUser() {
		String uAccount = user.getUAccount();
		System.out.println("json_findUserִ��: " + uAccount);

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
		// ���ؽ��
		return "find_success";
	}

	/**
	 * ���¶��û���Ϣ���޸�
	 * 
	 * @return
	 */
	public String json_updateUser() {
		try {
			a_user.setUGender((a_user.getUGender().equals("on") ? "��" : "Ů"));

			System.out.println("json_updateUserִ��: " + a_user.getUId() + ","
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
	 * ����û���Ϣ
	 * 
	 * @return
	 */
	public String json_saveUser() {
		String uAccount = a_user.getUAccount();
		System.out.println("json_findUserִ��: " + uAccount);

		try {
			saveFlag = true;
			System.out.println(saveFlag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "save_success";
	}
	
	
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	public String json_findAllUser() {
		System.out.println("json_findAllUserִ��: ");
		try {
			dataMap_AllUser = new HashMap<String, Object>();
			List<Users> list = new ArrayList<Users>();
			list = usersService.findAll();
			list = cutPage(list, pageIndex, pageSize); //��ҳ

			dataMap_AllUser.put("list", list);			
			dataMap_AllUser.put("pageIndex", pageIndex);
			dataMap_AllUser.put("pageSize", pageSize);
			dataMap_AllUser.put("pageCount", pageCount);
			
			//dataMap_AllUser.put("success_queryAllUser", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "findAll_success";
	}
	
	/**
	 * ���ݵ�ǰ����ҳ �� ÿҳ��С���з�ҳ
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
	
	

//	public Map<String, Object> json_Test() {
//		try {
//			dataMap = new HashMap<String, Object>();
//			List list = usersService.findByUAccount("test");
//			dataMap.put("list", list);
//			dataMap.put("success", true);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		// ���ؽ��
//		return dataMap;
//	}

}
