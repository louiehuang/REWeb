package com.chinasoft.service;

import java.util.Collection;
import java.util.List;

import com.chinasoft.dao.CollectDAO;
import com.chinasoft.pojo.Collect;
import com.chinasoft.pojo.Users;

/**
 * 
 * @author öÎÉñ
 *
 */
public class CollectService {
	private CollectDAO collectDAO;


	public CollectDAO getCollectDAO() {
		return collectDAO;
	}

	public void setCollectDAO(CollectDAO collectDAO) {
		this.collectDAO = collectDAO;
	}

	public String getCollect(Users users, int HId, int CType) {
		List list = collectDAO.findByHId(HId);
		System.out.println(users.getUId() + " " + HId + " " + CType
				+ "~~~~~~~~~");
		for (int i = 0; i < list.size(); i++) {
			Collect Collect = (Collect) list.get(i);
			System.out.println(Collect.getUsers().getUId() + " "
					+ Collect.getHId() + " " + Collect.getCType());
			if (
					(Collect.getUsers().getUId().equals(users.getUId()))
					
					&&
					(Collect.getCType().equals((Integer) CType))
					
					)
			{
				return "true";
			}
			else {
				System.out.println("wang");
			}
		}
		return "false";
	}

	public String clickCollect(Users users, int HId, int CType) {
		List list = collectDAO.findByHId(HId);
		int flag = 0;
		for (int i = 0; i < list.size(); i++) {
			Collect Collect = (Collect) list.get(i);
			if (Collect.getUsers().getUId().equals(users.getUId())
					&& Collect.getCType().equals((Integer) CType)) {
				flag = i + 1;
				break;
			}
		}
		if (flag != 0) {
			collectDAO.delete((Collect) list.get(flag - 1));
		} else {
			Collect Collect = new Collect(users, HId, CType);
			// Collect.setHId(1);
			System.out.println(users.getUName() + " " + HId + " " + CType);
			collectDAO.save(Collect);
		}
		return "ok";
	}
}
