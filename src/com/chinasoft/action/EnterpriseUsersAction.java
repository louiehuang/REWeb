package com.chinasoft.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.service.EnterpriseUsersService;
import com.chinasoft.util.Encryption;

public class EnterpriseUsersAction {
	
	private EnterpriseUsersService enterpriseUsersService;
	private EnterpriseUsers enterUsers; //��ҵ�û�
	private Map<String, Object> dataMap; // �����˺Ų�ѯ������ҵ�û�
	
	private HttpSession session;
	

	/**
	 * ��ҵ�û���¼�ж�
	 * @return
	 */
	public String json_loginEnterUser(){
		String uAccount = enterUsers.getUAccount();
		String pwd = Encryption.getMD5(enterUsers.getUPwd()); // ����
		enterUsers.setUPwd(pwd);

		System.out.println("json_loginEnterUserִ��: " + uAccount + ", " + pwd);

		try {
			dataMap = new HashMap<String, Object>();
			List<EnterpriseUsers> list = enterpriseUsersService.findByExample(enterUsers);

			// ��½��־��userLoginFlagΪ1��ʾ��½ʧ�ܣ�û�ж�Ӧ�˻�
			if (list.size() == 0) {
				dataMap.put("euserLoginFlag", "1");
			} else {
				// users����session
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("enterpriseUsers", list.get(0));

				dataMap.put("euserLoginFlag", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "eu_login_success";
		
	}
	
	/**
	 * �˳���½ �Ƴ�session�е���ҵ�û�users
	 * 
	 * @return
	 */
	public String signOut() {
		System.out.println("signOut��ҵ�û�ִ��...");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (session.getAttribute("enterpriseUsers") != null) {
			session.removeAttribute("enterpriseUsers");
		}else{
			System.out.println("signOut: û�е�½��ҵ�û�");
		}
		
		return "signout";
	}
	
	
	
	
	
	public EnterpriseUsers getEnterUsers() {
		return enterUsers;
	}

	public void setEnterUsers(EnterpriseUsers enterUsers) {
		this.enterUsers = enterUsers;
	}

	public EnterpriseUsersService getEnterpriseUsersService() {
		return enterpriseUsersService;
	}

	public void setEnterpriseUsersService(
			EnterpriseUsersService enterpriseUsersService) {
		this.enterpriseUsersService = enterpriseUsersService;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}	
	
	
	
	
	
	
	

}
