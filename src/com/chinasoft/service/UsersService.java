package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.UsersDAO;
import com.chinasoft.pojo.Users;

public class UsersService {
	// dao层操作数据库
	// 一样需要get和set进行注入
	private UsersDAO usersDAO;

	public UsersDAO getUsersDAO() {
		return usersDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	// 这一层可以返回任意类型，不用通action层只能返回String
	// 此层也可以传参数
	@SuppressWarnings("unchecked")
	public Users login(Users users) {
		List<Users> list = usersDAO.findByExample(users);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public boolean register(Users users) {
		boolean flag = true;
		try {
			usersDAO.save(users);
		} catch (RuntimeException re) {
			flag = false;
			throw re;
		}
		return flag;
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> findByUAccount(Object UAccount) {
		return usersDAO.findByUAccount(UAccount);
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> findByExample(Users user) {
		return usersDAO.findByExample(user);
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> findAll(){
		return usersDAO.findAll();
	} 
	
	public void save(Users user){
		usersDAO.save(user);
	}
	
	
	public void update(Users user) {
		usersDAO.update(user);
	}
	


}