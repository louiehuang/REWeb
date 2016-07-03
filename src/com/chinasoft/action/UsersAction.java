package com.chinasoft.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;

public class UsersAction {
	private UsersService service; //ҵ��ӿڶ�����Spring����������в���new��ֻ��get��set
	private Users users; //�û�����
	private Users a_user; //����Ա������û�����
	private HttpSession session;

	public UsersService getService() {
		return service;
	}

	public void setService(UsersService service) {
		this.service = service;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Users getA_user() {
		return a_user;
	}

	public void setA_user(Users a_user) {
		this.a_user = a_user;
	}

	//action�з����ķ���ֵ����ֻ����String
	//struts��ֵ����get��setʵ�֣�����action���еķ�����Ҫ������! ����ᱨ404
	public String login(){
		System.out.println("loginִ��: " + users.getUAccount());
		
		Users curUser = service.login(users);
		if(curUser != null){
			//users����session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", curUser);
			
//			System.out.println("��½�ɹ�, " + users);
			return "logsuccess";
		}
		else{
			System.out.println("��½ʧ��");
			return "error";
		}
	}
	
	/**
	 * �˳���½
	 * �Ƴ�session��users
	 * @return
	 */
	public String signOut(){
		System.out.println("signOutִ��: " + users.getUAccount());
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("users");
		return "signout";
	}
	
	public Users loiginTest(Users users){
		return service.login(users);
	}
	
	public String register(){
		System.out.println("registerִ��: " + users.getUAccount());
		
		Boolean flag = service.register(users);
		
		if(flag == true){
			//�浽session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users);
			return "regsuccess";
		}
		else{
			return "error";
		}
	}
	
	public String updateFromAdmin(){
		System.out.println("updateFromAdminִ��: " + a_user.getUAccount());
		service.save(a_user);
	
		return "admin_update_success";
	}
	
	
	
}