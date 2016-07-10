package com.chinasoft.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.UsersService;
import com.chinasoft.util.Encryption;

public class UsersAction {
	private UsersService service; // 业务接口对象，有Spring，在这个类中不用new，只用get和set
	private Users users; // 用户对象
	private Users s_user; //弹窗登陆
	
	public Users getS_user() {
		return s_user;
	}

	public void setS_user(Users s_user) {
		this.s_user = s_user;
	}

	private Users a_user; // 管理员管理的用户对象
	
	private HttpSession session;

	// action中方法的返回值类型只能是String
	// struts传值，由get和set实现，所以action层中的方法不要带参数! 否则会报404

	
	/*Session中，普通用户users， 卖家sellUsers，企业enterpriseUsers*/
	
	/*卖家弹窗登陆*/
	public String sellrentlogin(){
		String pwd = Encryption.getMD5(s_user.getUPwd());
		s_user.setUPwd(pwd);
		
		System.out.println("弹窗登陆: " + s_user.getUAccount() + ", " +  pwd);

		Users users1 = service.login(s_user);


		if(users1 != null){
			session = ServletActionContext.getRequest().getSession();
			session.setAttribute("users", users1);
			return "sellrentlogsuccess";
		}
		else{
           return "sellrenterror";
		}
	}
	
	public void closeLayer(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		 PrintWriter out = response.getWriter();
		 out.write("<script charset='UTF-8'>alert('log success');parent.location.reload();var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index); </script>");
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	}
	
	public void logerror(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		 PrintWriter out = response.getWriter();
		 out.write("<script charset='UTF-8'>alert('log error');parent.location.reload();</script>");
	   }catch(Exception e){
		   e.printStackTrace();
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
		
		System.out.println("123");
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