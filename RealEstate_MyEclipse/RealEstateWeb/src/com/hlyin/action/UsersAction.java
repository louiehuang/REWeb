package com.hlyin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hlyin.model.Users;
import com.hlyin.service.UsersService;

public class UsersAction {
	private List list;
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	private Users users;
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	private String message;
	private String username;
	private String pwd;

	public String getMessage() {
		return message;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String execute() {
		System.out.println("execute被执行");
		System.out.println(users.getUsername());
		System.out.println(users.getPwd());
		if (users.getUsername().equals("admin") && users.getPwd().equals("123")) {
			Users users1 = new Users("tom");
			Users users2 = new Users("jack");
			list = new ArrayList<Users>();
			list.add(users1);
			list.add(users2);
			message = "登录成功!";
		} else {
			message = "失败!";
		}
		return "success";
	}
	
	public String loginJudge() {
		System.out.println("login被执行");
		System.out.println(users.getUsername());
		System.out.println(users.getPwd());
		
		if (users.getUsername().equals("admin") && users.getPwd().equals("123")) {
			return "login_success";
			//message = "<script language='JavaScript'>alert('登陆成功');" + "location.href='index.jsp';</script>";
		
		} else {
			
			//message = "<script language='JavaScript'>alert('登陆失败');" + "location.href='register.jsp';</script>";
		
		}
		return "login_fail";
	}
	
	public String registerJudge() {
		System.out.println("register被执行");
		System.out.println(users.getUsername());
		System.out.println(users.getPwd());
		System.out.println(users.getPwd_confirm());
		
		if (users.getUsername().equals("admin") && users.getPwd().equals("123")) {
			return "register_success";
	
		} else {
			
		}
		return "register_fail";
	}
}

