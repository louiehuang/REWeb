package com.hlyin.service;

import org.apache.tomcat.jni.User;

import com.hlyin.model.Users;

public class UsersService {
	public Users isLogin(String username, String pwd) {
		if (username.equals("admin") && pwd.equals("123")) {
			Users user = new Users();
			user.setUsername(username);
			user.setPwd(pwd);
			return user;
		}
		return null;
	}

	public Boolean isLogin(Users users) {
		if (users.getUsername().equals("admin") && users.getPwd().equals("123")) {
			return true;
		}
		return false;
	}

}
