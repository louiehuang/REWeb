package com.chinasoft.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;

public class UsersAction {
	private UsersService service; //业务接口对象，有Spring，在这个类中不用new，只用get和set
	private Users users; //用户对象
	private Users a_user; //管理员管理的用户对象
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

	//action中方法的返回值类型只能是String
	//struts传值，由get和set实现，所以action层中的方法不要带参数! 否则会报404
	public String login(){
		System.out.println("login执行: " + users.getUAccount());
		
		Users users1 = service.login(users);
		if(users1 != null){
			//users存入session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users);
			
//			System.out.println("登陆成功, " + users);
//			msg = "登陆成功";
			return "logsuccess";
		}
		else{
			System.out.println("登陆失败");
			return "error";
		}
	}
	
	/**
	 * 退出登陆
	 * 移出session中users
	 * @return
	 */
	public String signOut(){
		System.out.println("signOut执行: " + users.getUAccount());
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("users");
		return "signout";
	}
	
	public Users loiginTest(Users users){
		return service.login(users);
	}
	
	public String register(){
		System.out.println("register执行: " + users.getUAccount());
		
		Boolean flag = service.register(users);
		
		if(flag == true){
			//存到session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users);
			return "regsuccess";
		}
		else{
			return "error";
		}
	}
	
	public String updateFromAdmin(){
		System.out.println("updateFromAdmin执行: " + a_user.getUAccount());
		service.save(a_user);
	
		return "admin_update_success";
	}
	
	
	
}