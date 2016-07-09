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
	private EnterpriseUsers enterUsers; //企业用户
	private Map<String, Object> dataMap; // 根据账号查询单个企业用户
	
	private HttpSession session;
	

	/**
	 * 企业用户登录判断
	 * @return
	 */
	public String json_loginEnterUser(){
		String uAccount = enterUsers.getUAccount();
		String pwd = Encryption.getMD5(enterUsers.getUPwd()); // 加密
		enterUsers.setUPwd(pwd);

		System.out.println("json_loginEnterUser执行: " + uAccount + ", " + pwd);

		try {
			dataMap = new HashMap<String, Object>();
			List<EnterpriseUsers> list = enterpriseUsersService.findByExample(enterUsers);

			// 登陆标志，userLoginFlag为1表示登陆失败，没有对应账户
			if (list.size() == 0) {
				dataMap.put("euserLoginFlag", "1");
			} else {
				// users存入session
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("enterpriseUsers", list.get(0));

				dataMap.put("euserLoginFlag", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "eu_login_success";
		
	}
	
	/**
	 * 退出登陆 移出session中的企业用户users
	 * 
	 * @return
	 */
	public String signOut() {
		System.out.println("signOut企业用户执行...");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (session.getAttribute("enterpriseUsers") != null) {
			session.removeAttribute("enterpriseUsers");
		}else{
			System.out.println("signOut: 没有登陆企业用户");
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
