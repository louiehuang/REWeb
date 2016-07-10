package com.chinasoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.dialect.IngresDialect;

import com.chinasoft.pojo.Collect;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.CollectService;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;
import com.chinasoft.service.UsersService;
import com.chinasoft.util.Encryption;

public class CenterIndexAction {

	//HttpSession session1 = ServletActionContext.getRequest().getSession();

	private CollectService collectService;
	private UsersService userService;
	private HouseSellEnterpriseService collectHouseSellEnterpriseService;
	private HouseSellSecondhandService collectHouseSellSecondhandService;
	private HouseSellRentService collectHouseSellRentService;
	
	private List<Collect> collectList;
	private List<HouseSellEnterprise> collectHouseSellEnterpriseList;
	private List<HouseSellRent> collectHouseSellRentList;
	private List<HouseSellSecondhand> collectHouseSellSecondhandList;

	private List<Object> followAllList;
	private List<Collect> followList;
	private List<HouseSellEnterprise> followHouseSellEnterpriseList;
	private List<HouseSellRent> followHouseSellRentList;
	private List<HouseSellSecondhand> followHouseSellSecondhandList;

	private String changeEmail;
	private String changeName;
	private String changeGender;
	private String changeTele;
	
	private String changePwd;

	private String delFollowHouseSellEnterprise;
	private String delFollowHouseSellRent;
	private String delFollowHouseSellSecondhand;
	
	private Map<String, Object> dataMap;
	private String User_pwd;
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String getUser_pwd() {
		return User_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		User_pwd = user_pwd;
	}

	public CollectService getCollectService() {
		return collectService;
	}

	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}

	public UsersService getUserService() {
		return userService;
	}

	public void setUserService(UsersService userService) {
		this.userService = userService;
	}

	public HouseSellEnterpriseService getCollectHouseSellEnterpriseService() {
		return collectHouseSellEnterpriseService;
	}

	public void setCollectHouseSellEnterpriseService(
			HouseSellEnterpriseService collectHouseSellEnterpriseService) {
		this.collectHouseSellEnterpriseService = collectHouseSellEnterpriseService;
	}

	public HouseSellSecondhandService getCollectHouseSellSecondhandService() {
		return collectHouseSellSecondhandService;
	}

	public void setCollectHouseSellSecondhandService(
			HouseSellSecondhandService collectHouseSellSecondhandService) {
		this.collectHouseSellSecondhandService = collectHouseSellSecondhandService;
	}

	public HouseSellRentService getCollectHouseSellRentService() {
		return collectHouseSellRentService;
	}

	public void setCollectHouseSellRentService(
			HouseSellRentService collectHouseSellRentService) {
		this.collectHouseSellRentService = collectHouseSellRentService;
	}

	public List<Collect> getCollectList() {
		return collectList;
	}

	public void setCollectList(List<Collect> collectList) {
		this.collectList = collectList;
	}

	public List<HouseSellEnterprise> getCollectHouseSellEnterpriseList() {
		return collectHouseSellEnterpriseList;
	}

	public void setCollectHouseSellEnterpriseList(
			List<HouseSellEnterprise> collectHouseSellEnterpriseList) {
		this.collectHouseSellEnterpriseList = collectHouseSellEnterpriseList;
	}

	public List<HouseSellRent> getCollectHouseSellRentList() {
		return collectHouseSellRentList;
	}

	public void setCollectHouseSellRentList(
			List<HouseSellRent> collectHouseSellRentList) {
		this.collectHouseSellRentList = collectHouseSellRentList;
	}

	public List<HouseSellSecondhand> getCollectHouseSellSecondhandList() {
		return collectHouseSellSecondhandList;
	}

	public void setCollectHouseSellSecondhandList(
			List<HouseSellSecondhand> collectHouseSellSecondhandList) {
		this.collectHouseSellSecondhandList = collectHouseSellSecondhandList;
	}

	public List<Object> getFollowAllList() {
		return followAllList;
	}

	public void setFollowAllList(List<Object> followAllList) {
		this.followAllList = followAllList;
	}

	public List<Collect> getFollowList() {
		return followList;
	}

	public void setFollowList(List<Collect> followList) {
		this.followList = followList;
	}

	public List<HouseSellEnterprise> getFollowHouseSellEnterpriseList() {
		return followHouseSellEnterpriseList;
	}

	public void setFollowHouseSellEnterpriseList(
			List<HouseSellEnterprise> followHouseSellEnterpriseList) {
		this.followHouseSellEnterpriseList = followHouseSellEnterpriseList;
	}

	public List<HouseSellRent> getFollowHouseSellRentList() {
		return followHouseSellRentList;
	}

	public void setFollowHouseSellRentList(
			List<HouseSellRent> followHouseSellRentList) {
		this.followHouseSellRentList = followHouseSellRentList;
	}

	public List<HouseSellSecondhand> getFollowHouseSellSecondhandList() {
		return followHouseSellSecondhandList;
	}

	public void setFollowHouseSellSecondhandList(
			List<HouseSellSecondhand> followHouseSellSecondhandList) {
		this.followHouseSellSecondhandList = followHouseSellSecondhandList;
	}

	public String getChangeEmail() {
		return changeEmail;
	}

	public void setChangeEmail(String changeEmail) {
		this.changeEmail = changeEmail;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getChangeGender() {
		return changeGender;
	}

	public void setChangeGender(String changeGender) {
		this.changeGender = changeGender;
	}

	public String getChangeTele() {
		return changeTele;
	}

	public void setChangeTele(String changeTele) {
		this.changeTele = changeTele;
	}

	public String getChangePwd() {
		return changePwd;
	}

	public void setChangePwd(String changePwd) {
		this.changePwd = changePwd;
	}

	public String getDelFollowHouseSellEnterprise() {
		return delFollowHouseSellEnterprise;
	}

	public void setDelFollowHouseSellEnterprise(String delFollowHouseSellEnterprise) {
		this.delFollowHouseSellEnterprise = delFollowHouseSellEnterprise;
	}

	public String getDelFollowHouseSellRent() {
		return delFollowHouseSellRent;
	}

	public void setDelFollowHouseSellRent(String delFollowHouseSellRent) {
		this.delFollowHouseSellRent = delFollowHouseSellRent;
	}

	public String getDelFollowHouseSellSecondhand() {
		return delFollowHouseSellSecondhand;
	}

	public void setDelFollowHouseSellSecondhand(String delFollowHouseSellSecondhand) {
		this.delFollowHouseSellSecondhand = delFollowHouseSellSecondhand;
	}

	public String LoadInfo() {

		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			collectList = collectService.getCollectInfo((Users) session1.getAttribute("users"));
			
			
			
			//collectList = collectService.findAll();
			collectHouseSellEnterpriseList = new ArrayList<HouseSellEnterprise>();
			collectHouseSellSecondhandList = new ArrayList<HouseSellSecondhand>();
			collectHouseSellRentList = new ArrayList<HouseSellRent>();
			for (int i = 0; i < collectList.size(); i++) {
				if (collectList.get(i).getCType().equals(1)) {
					collectHouseSellEnterpriseList
							.add(collectHouseSellEnterpriseService
									.getCollectInfo(collectList.get(i).getHId()));
				} else if (collectList.get(i).getCType().equals(2)) {
					collectHouseSellSecondhandList
							.add(collectHouseSellSecondhandService
									.getCollectInfo(collectList.get(i).getHId()));
				} else if (collectList.get(i).getCType().equals(3)) {
					collectHouseSellRentList.add(collectHouseSellRentService
							.getCollectInfo(collectList.get(i).getHId()));
				}
			}

			/* Àıtitle */
			for (int i = 0; i < collectHouseSellEnterpriseList.size(); i++) {
				String str = new String();
				String str1 = new String();
				str = collectHouseSellEnterpriseList.get(i).getTitle();
				if (str.length() > 13) {
					str1 = str.substring(0, 11) + "...";
					collectHouseSellEnterpriseList.get(i).setTitle(str1);
				}
			}
			for (int i = 0; i < collectHouseSellSecondhandList.size(); i++) {
				String str = new String();
				String str1 = new String();
				str = collectHouseSellSecondhandList.get(i).getTitle();
				if (str.length() > 13) {
					str1 = str.substring(0, 11) + "...";
					collectHouseSellSecondhandList.get(i).setTitle(str1);
				}
			}
			for (int i = 0; i < collectHouseSellRentList.size(); i++) {
				String str = new String();
				String str1 = new String();
				str = collectHouseSellRentList.get(i).getTitle();
				if (str.length() > 13) {
					str1 = str.substring(0, 11) + "...";
					collectHouseSellRentList.get(i).setTitle(str1);
				}
			}

		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}

		return "success";

	}

	public String LoadFollowInfo() {

		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			followList = collectService.getCollectInfo((Users) session1.getAttribute("users"));
			//followList = collectService.findAll();
			followHouseSellEnterpriseList = new ArrayList<HouseSellEnterprise>();
			followHouseSellSecondhandList = new ArrayList<HouseSellSecondhand>();
			followHouseSellRentList = new ArrayList<HouseSellRent>();
			followAllList = new ArrayList<Object>();
			for (int i = 0; i < followList.size(); i++) {
				if (followList.get(i).getCType().equals(1)) {
					followAllList.add(collectHouseSellEnterpriseService
							.getCollectInfo(followList.get(i).getHId()));
					followHouseSellEnterpriseList
							.add(collectHouseSellEnterpriseService
									.getCollectInfo(followList.get(i).getHId()));
				} else if (collectList.get(i).getCType().equals(2)) {
					followAllList.add(collectHouseSellSecondhandService
							.getCollectInfo(followList.get(i).getHId()));
					followHouseSellSecondhandList
							.add(collectHouseSellSecondhandService
									.getCollectInfo(followList.get(i).getHId()));
				} else if (collectList.get(i).getCType().equals(3)) {
					followAllList.add(collectHouseSellRentService
							.getCollectInfo(followList.get(i).getHId()));
					followHouseSellRentList.add(collectHouseSellRentService
							.getCollectInfo(followList.get(i).getHId()));
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return "success";
	}

	public String changePersonInfo() {
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			userService.changePInfo((Users)session1.getAttribute("users"),changeEmail,changeName,changeGender,changeTele);
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return LoadInfo();
	}
	
	public String changePersonPwd(){
		try {
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			String chp = Encryption.getMD5(changePwd);
			userService.changePPwd((Users)session1.getAttribute("users"),chp);
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
		return LoadInfo();
	}
	
	public String checkPwd() {
		
		try {
			String pwd = Encryption.getMD5(User_pwd);
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			String uPwd = ((Users)(session1.getAttribute("users"))).getUPwd();
			dataMap = new HashMap<String, Object>();
			
			//System.out.println(pwd + "," + uPwd);
			
			// √‹¬Î’˝»∑÷√0£¨√‹¬Î¥ÌŒÛ÷√1
			if (pwd.equals(uPwd)) {
				dataMap.put("userPwd", "0");
			} else {
				dataMap.put("userPwd", "1");
			}

		} catch (Exception e) {
			System.out.println(e);
			//return "error";
		}
		// ∑µªÿΩ·π˚
		return "find_success";
	}

	
	public String deleteFollowHouseSellEnterprise(){
		try{
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			collectService.deleteFollow((Users) session1.getAttribute("users"),Integer.parseInt(delFollowHouseSellEnterprise),1);
		}catch(Exception e){
			System.out.println(e);
			return "error";
		}
		return LoadFollowInfo();
	}
	
	public String deleteFollowHouseSellSecondhand(){
		try{
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			collectService.deleteFollow((Users) session1.getAttribute("users"),Integer.parseInt(delFollowHouseSellSecondhand),2);
		}catch(Exception e){
			System.out.println(e);
			return "error";
		}
		return LoadFollowInfo();
	}
	
	public String deleteFollowHouseSellRent(){
		try{
			HttpSession session1 = ServletActionContext.getRequest().getSession();
			collectService.deleteFollow((Users) session1.getAttribute("users"),Integer.parseInt(delFollowHouseSellRent),3);
		}catch(Exception e){
			System.out.println(e);
			return "error";
		}
		return LoadFollowInfo();
	}
	
}
