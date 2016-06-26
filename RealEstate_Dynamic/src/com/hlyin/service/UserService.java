package com.hlyin.service;
import com.hlyin.model.Users;

public class UserService {
	public Boolean isLogin(Users users){
		if(users.getUsername().equals("admin") && users.getPwd().equals("123")){
			return true;
		}
		return false;		
	}
	
	public Boolean isLogin(String username, String pwd){
		if(username.equals("admin") && pwd.equals("123")){
			return true;
		}
		return false;		
	}
}
