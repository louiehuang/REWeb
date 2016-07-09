package com.chinasoft.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;
import com.chinasoft.util.Encryption;

public class UsersAction {
	private UsersService service; // ҵ��ӿڶ�����Spring����������в���new��ֻ��get��set
	private Users users; // �û�����
	
	private Users a_user; // ����Ա������û�����
	
	private HttpSession session;

	// action�з����ķ���ֵ����ֻ����String
	// struts��ֵ����get��setʵ�֣�����action���еķ�����Ҫ������! ����ᱨ404

	
	/*Session�У���ͨ�û�users�� ����sellUsers����ҵenterpriseUsers*/
	
	/*���ҵ�����½*/
	public String sellrentlogin(){
		Users users1 = service.login(users);
		if(users1 != null){
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("sellUsers", users1);
			return "sellrentlogsuccess";
		}
		else{

			return "sellrenterror";
		}
	}
	
	
	/**
	 * �˳���½ �Ƴ�session�еĸ����û�users
	 * 
	 * @return
	 */
	public String signOut() {
		System.out.println("signOutִ��...");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (session.getAttribute("users") != null) {
			session.removeAttribute("users");
		}else{
			System.out.println("signOut: û�е�½�û�");
		}
		
		return "signout";
	}

	public Users loiginTest(Users users) {
		return service.login(users);
	}

	/**
	 * �û�ע��
	 * @return
	 */
	public String register() {
		String uAccount = users.getUAccount();
		String pwd = Encryption.getMD5(users.getUPwd()); //����
		users.setUPwd(pwd);
		
		System.out.println("registerִ��: " + uAccount + ", " + pwd);

		Boolean flag = service.register(users);

		if (flag == true) {
			// �浽session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users);
			return "regsuccess";
		} else {
			return "error";
		}
	}

	public String updateFromAdmin() {
		System.out.println("updateFromAdminִ��: " + a_user.getUAccount());
		service.save(a_user);

		return "admin_update_success";
	}

	

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


}