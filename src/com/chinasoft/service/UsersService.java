package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.UsersDAO;
import com.chinasoft.pojo.Users;

public class UsersService {
	// dao��������ݿ�
	// һ����Ҫget��set����ע��
	private UsersDAO usersDAO;

	public UsersDAO getUsersDAO() {
		return usersDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	// ��һ����Է����������ͣ�����ͨaction��ֻ�ܷ���String
	// �˲�Ҳ���Դ�����
	/**
	 * �û���¼
	 * @param users
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Users login(Users users) {
		List<Users> list = usersDAO.findByExample(users);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	/**
	 * �û�ע��
	 * @param users
	 * @return
	 */
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
	
	/**
	 * �������
	 * @param UId
	 * @return
	 */
	public Users getUsers(int UId)
	{
		Users users = usersDAO.findById(UId);
		return users;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Users> findByExample(Users user) {
		return usersDAO.findByExample(user);
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> findAll(){
		return usersDAO.findAll();
	} 
	
	/**
	 * �����û�
	 * @param user
	 */
	public void save(Users user){
		usersDAO.save(user);
	}
	
	
	/**
	 * �����û���Ϣ
	 * @param user
	 */
	public void update(Users user) {
		usersDAO.update(user);
	}
	
	/**
	 * �����û�ID��ѯ�û�
	 * @param id
	 * @return
	 */
	public Users findById(Integer id) {
		return usersDAO.findById(id);
	}
	
	/**
	 * ɾ���û�
	 * @param user
	 */
	public void delete(Users user) {
		usersDAO.delete(user);
	}
	


}