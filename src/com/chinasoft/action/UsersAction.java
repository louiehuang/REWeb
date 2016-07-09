package com.chinasoft.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;
import com.chinasoft.util.Encryption;

public class UsersAction {
	private UsersService service; // 业务接口对象，有Spring，在这个类中不用new，只用get和set
	private Users users; // 用户对象
	
	private Users a_user; // 管理员管理的用户对象
	
	private HttpSession session;

	// action中方法的返回值类型只能是String
	// struts传值，由get和set实现，所以action层中的方法不要带参数! 否则会报404

	
	/*Session中，普通用户users， 卖家sellUsers，企业enterpriseUsers*/
	
	/*卖家弹窗登陆*/
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
	 * 退出登陆 移出session中的个人用户users
	 * 
	 * @return
	 */
	public String signOut() {
		System.out.println("signOut执行...");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (session.getAttribute("users") != null) {
			session.removeAttribute("users");
		}else{
			System.out.println("signOut: 没有登陆用户");
		}
		
		return "signout";
	}

	public Users loiginTest(Users users) {
		return service.login(users);
	}

	/**
	 * 用户注册
	 * @return
	 */
	public String register() {
		String uAccount = users.getUAccount();
		String pwd = Encryption.getMD5(users.getUPwd()); //加密
		users.setUPwd(pwd);
		
		System.out.println("register执行: " + uAccount + ", " + pwd);

		Boolean flag = service.register(users);

		if (flag == true) {
			// 存到session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users);
			return "regsuccess";
		} else {
			return "error";
		}
	}

	public String updateFromAdmin() {
		System.out.println("updateFromAdmin执行: " + a_user.getUAccount());
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