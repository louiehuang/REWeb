package com.chinasoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.EnterpriseUsersService;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.util.Encryption;

public class CenterEnterpriseIndexAction {
	
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private EnterpriseUsersService enterpriseUsersService;
	
	private String changeEnterPriseEmail;
	private String changeEnterPriseInfo;
	private String changeEnterPriseTele;
	private String changeEnterPriseAddr;
	
	private List<HouseSellEnterprise> houseSellEnterpriseList;
	
	private String changeEnterPrisePwd;
	
	private String delMyHouseSellEnterprise;
	
	private Map<String, Object> dataMap;
	private String UserEnterprisepwd;

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String getUserEnterprisepwd() {
		return UserEnterprisepwd;
	}

	public void setUserEnterprisepwd(String userEnterprisepwd) {
		UserEnterprisepwd = userEnterprisepwd;
	}

	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}

	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}

	public EnterpriseUsersService getEnterpriseUsersService() {
		return enterpriseUsersService;
	}

	public void setEnterpriseUsersService(
			EnterpriseUsersService enterpriseUsersService) {
		this.enterpriseUsersService = enterpriseUsersService;
	}

	public String getChangeEnterPriseEmail() {
		return changeEnterPriseEmail;
	}

	public void setChangeEnterPriseEmail(String changeEnterPriseEmail) {
		this.changeEnterPriseEmail = changeEnterPriseEmail;
	}

	public String getChangeEnterPriseInfo() {
		return changeEnterPriseInfo;
	}

	public void setChangeEnterPriseInfo(String changeEnterPriseInfo) {
		this.changeEnterPriseInfo = changeEnterPriseInfo;
	}

	public String getChangeEnterPriseTele() {
		return changeEnterPriseTele;
	}

	public void setChangeEnterPriseTele(String changeEnterPriseTele) {
		this.changeEnterPriseTele = changeEnterPriseTele;
	}

	public String getChangeEnterPriseAddr() {
		return changeEnterPriseAddr;
	}

	public void setChangeEnterPriseAddr(String changeEnterPriseAddr) {
		this.changeEnterPriseAddr = changeEnterPriseAddr;
	}

	public String getChangeEnterPrisePwd() {
		return changeEnterPrisePwd;
	}

	public void setChangeEnterPrisePwd(String changeEnterPrisePwd) {
		this.changeEnterPrisePwd = changeEnterPrisePwd;
	}

	public List<HouseSellEnterprise> getHouseSellEnterpriseList() {
		return houseSellEnterpriseList;
	}

	public String getDelMyHouseSellEnterprise() {
		return delMyHouseSellEnterprise;
	}

	public void setDelMyHouseSellEnterprise(String delMyHouseSellEnterprise) {
		this.delMyHouseSellEnterprise = delMyHouseSellEnterprise;
	}

	public void setHouseSellEnterpriseList(
			List<HouseSellEnterprise> houseSellEnterpriseList) {
		this.houseSellEnterpriseList = houseSellEnterpriseList;
	}

	public String LoadEnterpirseInfo(){
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			houseSellEnterpriseList = houseSellEnterpriseService.getInfo((EnterpriseUsers)session1.getAttribute("enterpriseUsers"));
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return "success";
	}
	
	public String changeEnterpriseInfo() {
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			enterpriseUsersService.changeEnterpriseInfo((EnterpriseUsers)session1.getAttribute("enterpriseUsers"),changeEnterPriseEmail,changeEnterPriseInfo,changeEnterPriseTele,changeEnterPriseAddr);
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return LoadEnterpirseInfo();
	}
	
	public String changeEnterprisePwd(){
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			enterpriseUsersService.changeEnterprisePwd((EnterpriseUsers)session1.getAttribute("enterpriseUsers"),changeEnterPrisePwd);
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return LoadEnterpirseInfo();
	}
	
	public String deleteHouseSellEnterprise(){
		try {
			houseSellEnterpriseService.deleteHouseSellEnterprise(Integer.parseInt(delMyHouseSellEnterprise));
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return LoadEnterpirseInfo();
	}
	
	public String checkEnterprisePwd() {
		
		try {
			String pwd = Encryption.getMD5(UserEnterprisepwd);
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			String uPwd = ((Users)(session1.getAttribute("enterpriseUsers"))).getUPwd();
			dataMap = new HashMap<String, Object>();
			
			//System.out.println(pwd + "," + uPwd);
			
			// √‹¬Î’˝»∑÷√0£¨√‹¬Î¥ÌŒÛ÷√1
			if (pwd.equals(uPwd)) {
				dataMap.put("userEnterprisePwd", "0");
			} else {
				dataMap.put("userEnterprisePwd", "1");
			}

		} catch (Exception e) {
			System.out.println(e);
			//return "error";
		}
		// ∑µªÿΩ·π˚
		return "find_success";
	}
	
}
