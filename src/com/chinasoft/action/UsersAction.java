package com.chinasoft.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;

public class UsersAction {
	private UsersService service; //业务接口对象，有Spring，在这个类中不用new，只用get和set
	private Users users; //用户对象
	private String msg; //返回页面的值
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
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	//action中方法的返回值类型只能是String
	//struts传值，由get和set实现，所以action层中的方法不要带参数! 否则会报404
	public String login(){
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
//			msg = "登陆失败";
			return "error";
		}
	}
	
	/**
	 * 退出登陆
	 * 移出session中users
	 * @return
	 */
	public String signOut(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("users");
		return "signout";
	}
	
	public Users loiginTest(Users users){
		return service.login(users);
	}
	
	public String register(){
		Boolean flag = service.register(users);
		
		if(flag == true){
			//存到session
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users);
//			msg = "注册成功";
			return "regsuccess";
		}
		else{
//			msg = "注册失败";
			return "error";
		}
	}
	
	
	
}