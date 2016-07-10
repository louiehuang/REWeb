package com.chinasoft.service;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.dao.EnterpriseUsersDAO;
import com.chinasoft.pojo.EnterpriseUsers;

public class EnterpriseUsersService {
	private EnterpriseUsersDAO enterpriseUsersDAO;

	public EnterpriseUsersDAO getEnterpriseUsersDAO() {
		return enterpriseUsersDAO;
	}

	public void setEnterpriseUsersDAO(EnterpriseUsersDAO enterpriseUsersDAO) {
		this.enterpriseUsersDAO = enterpriseUsersDAO;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<EnterpriseUsers> findByExample(EnterpriseUsers euser){
		return enterpriseUsersDAO.findByExample(euser);
	}
	
	public EnterpriseUsers findById(int UId)
	{
		return enterpriseUsersDAO.findById(UId);
	}
	
	
	//修改企业用户信息
		public void changeEnterpriseInfo(EnterpriseUsers enterpriseUsers,String changeEnterPriseEmail,String changeEnterPriseInfo,String changeEnterPriseTele,String changeEnterPriseAddr){
			EnterpriseUsers u = enterpriseUsersDAO.findById(enterpriseUsers.getUId());
			if(!"".equals(changeEnterPriseEmail)){
				u.setUEmail(changeEnterPriseEmail);
			}
			if(!"".equals(changeEnterPriseTele)){
				u.setUTele(changeEnterPriseTele);
			}
			if(!"".equals(changeEnterPriseInfo)){
				u.setUInfo(changeEnterPriseInfo);
			}
			if(!"".equals(changeEnterPriseAddr)){
				u.setUAddr(changeEnterPriseAddr);
			}
			enterpriseUsersDAO.update(u);
			ServletActionContext.getRequest().getSession().setAttribute("enterpriseUsers", u);
		}
		
		//修改企业用户密码
		public void changeEnterprisePwd(EnterpriseUsers enterpriseUsers,String changeEnterPrisePwd){
			EnterpriseUsers u = enterpriseUsersDAO.findById(enterpriseUsers.getUId());
			if(!"".equals(changeEnterPrisePwd)){
				u.setUPwd(changeEnterPrisePwd);
			}
			enterpriseUsersDAO.update(u);
			ServletActionContext.getRequest().getSession().setAttribute("enterpriseUsers", u);
		}
		
		//根据企业用户id查找企业用户信息
		public EnterpriseUsers getEnterpriseUsersInfo(int UId){
			return enterpriseUsersDAO.findById(UId);
		}
	
	
	

}
