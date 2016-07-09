package com.chinasoft.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasoft.pojo.Administrator;
import com.chinasoft.pojo.Advertisement;
import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Verification;
import com.chinasoft.service.AdministratorService;
import com.chinasoft.service.AdvertisementService;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;
import com.chinasoft.service.VerificationService;
import com.chinasoft.util.Encryption;
import com.chinasoft.util.PageMan;

public class AdministratorAction {
	/*管理员*/
	private Map<String, Object> dataMap_Admin;
	private AdministratorService administratorService;
	private Administrator administrator;
	private HttpSession session;
	
	/* 查询房屋 */
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellRentService houseSellRentService;

	private Map<String, Object> dataMap_AllHouse;
	private String HId;
	private int house_pageIndex = 1;
	private int house_pageSize = 10; // 默认分页大小
	private int house_pageCount = 0;
	private String house_queryMode;

	/* 查询验证 */
	private VerificationService verificationService;
	private Map<String, Object> dataMap_Veri;
	private int veri_pageIndex = 1;
	private int veri_pageSize = 10; // 默认分页大小
	private int veri_pageCount = 0;
	private String veri_queryMode;
	private String VId; // 验证的id
	private Verification veri; // 验证对象
	private String processRes; // 处理结果

	/* 广告管理 */
	private AdvertisementService advertisementService;
	private Map<String, Object> dataMap_Ad;
	private int ad_pageIndex = 1;
	private int ad_pageSize = 10; // 默认分页大小
	private int ad_pageCount = 0;
	private String AId; // 验证的id
	private Advertisement ad; // 验证对象

	
	/**
	 * 管理员登录判断
	 * @return
	 */
	public String json_loginAdminUser(){
		String uAccount = administrator.getAccount();
		String pwd = Encryption.getMD5(administrator.getPwd()); // 加密
		administrator.setPwd(pwd);

		System.out.println("json_loginEnterUser执行: " + uAccount + ", " + pwd);

		try {
			dataMap_Admin = new HashMap<String, Object>();
			List<Administrator> list = administratorService.findByExample(administrator);

			// 登陆标志，userLoginFlag为1表示登陆失败，没有对应账户
			if (list.size() == 0) {
				System.out.println("登陆失败");
				dataMap_Admin.put("adminLoginFlag", "1");
			} else {
				// users存入session
				System.out.println("登陆成功");
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("adminUsers", list.get(0));

				dataMap_Admin.put("adminLoginFlag", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "admin_login_success";
		
	}
	
	/**
	 * 退出登陆 移出session中的管理员户adminUsers
	 * @return
	 */
	public String signOut() {
		System.out.println("signOut管理员用户执行...");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (session.getAttribute("adminUsers") != null) {
			session.removeAttribute("adminUsers");
		}else{
			System.out.println("signOut: 没有登陆管理员用户");
		}
		
		return "signout";
	}
	
	
	
	/**
	 * 删除房屋信息，并更新列表
	 * 
	 * @return
	 */
	public String json_deleteHouse() {
		System.out.println("json_deleteHouse执行, 删除 " + HId);

		try {
			if (house_queryMode.equals("HouseSellEnterprise")) {
				HouseSellEnterprise house = houseSellEnterpriseService
						.findById(Integer.parseInt(HId));
				houseSellEnterpriseService.delete(house);
				// 删除后更新前台企业新房表显示
				String update = json_queryAllHouse(); // 不需要接收返回值
			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				HouseSellSecondhand house = houseSellSecondhandService
						.findById(Integer.parseInt(HId));
				houseSellSecondhandService.delete(house);
				// 删除后更新前台二手房表显示
				String update = json_queryAllHouse(); // 不需要接收返回值
			} else if (house_queryMode.equals("HouseSellRent")) {
				HouseSellRent house = houseSellRentService.findById(Integer
						.parseInt(HId));
				houseSellRentService.delete(house);
				// 删除后更新前台二手房表显示
				String update = json_queryAllHouse(); // 不需要接收返回值
			}
			dataMap_AllHouse.put("deleteHouse_success", true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "deleteHouse_success";
	}

	/**
	 * 查询所有房屋信息，并分页
	 * 
	 * @return
	 */
	public String json_queryAllHouse() {
		System.out.println("json_queryAllHouse执行, 查询:" + house_queryMode);
		/* 判断查询类型 */

		try {
			dataMap_AllHouse = new HashMap<String, Object>();

			if (house_queryMode.equals("HouseSellEnterprise")) {
				List<HouseSellEnterprise> enterList = houseSellEnterpriseService
						.findAll();

				/* 分页，接收分页后list和分页页数 */
				Map<String, Object> tmp = PageMan.cutHousePage(enterList,
						house_pageIndex, house_pageSize);
				dataMap_AllHouse.put("enterList", tmp.get("newList"));
				dataMap_AllHouse.put("house_pageCount", tmp.get("pageCount"));

			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				List<HouseSellSecondhand> secondList = houseSellSecondhandService
						.findAll();

				/* 分页，接收分页后list和分页页数 */
				Map<String, Object> tmp = PageMan.cutHousePage(secondList,
						house_pageIndex, house_pageSize);

				dataMap_AllHouse.put("secondList", tmp.get("newList"));
				dataMap_AllHouse.put("house_pageCount", tmp.get("pageCount"));

			} else if (house_queryMode.equals("HouseSellRent")) {
				List<HouseSellRent> rentList = houseSellRentService.findAll();

				/* 分页，接收分页后list和分页页数 */
				Map<String, Object> tmp = PageMan.cutHousePage(rentList,
						house_pageIndex, house_pageSize);
				dataMap_AllHouse.put("rentList", tmp.get("newList"));
				dataMap_AllHouse.put("house_pageCount", tmp.get("pageCount"));

			}

			dataMap_AllHouse.put("house_pageIndex", house_pageIndex);
			dataMap_AllHouse.put("house_pageSize", house_pageSize);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 返回结果
		return "findAllHouse_success";
	}

	/**
	 * 查询所有验证申请并分页
	 * 
	 * @return
	 */
	public String json_queryVeri() {
		System.out.println("json_queryVeri执行, 查询:" + veri_queryMode);
		/* 判断查询类型 */

		try {
			dataMap_Veri = new HashMap<String, Object>();

			if (veri_queryMode.equals("queryVerificaton")) {
				int status = 0; // 查询未处理的
				List<Verification> unprocessedList = verificationService
						.findByVstatus(status);

				/* 分页，接收分页后list和分页页数 */
				Map<String, Object> tmp = PageMan.cutVeriPage(unprocessedList,
						veri_pageIndex, veri_pageSize);

				dataMap_Veri.put("unprocessedList", tmp.get("newList"));
				dataMap_Veri.put("veri_pageCount", tmp.get("pageCount"));

			} else if (veri_queryMode.equals("queryVerificaton_processed")) {
				int status = 1;
				List<Verification> processedList = verificationService
						.findByVstatus(status);

				/* 分页，接收分页后list和分页页数 */
				Map<String, Object> tmp = PageMan.cutVeriPage(processedList,
						veri_pageIndex, veri_pageSize);

				dataMap_Veri.put("processedList", tmp.get("newList"));
				dataMap_Veri.put("veri_pageCount", tmp.get("pageCount"));

			}

			dataMap_Veri.put("veri_pageIndex", veri_pageIndex);
			dataMap_Veri.put("veri_pageSize", veri_pageSize);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 返回结果
		return "findVeri_success";
	}

	/**
	 * 更新验证处理结果，并更新相应状态（结果设为未处理时状态置为未处理0）
	 * 
	 * @return
	 */
	public String json_updateVeri() {
		System.out.println("json_updateVeri执行...");
		try {
			Verification veri = verificationService.findById(Integer
					.parseInt(VId));

			System.out.println(processRes);

			if (processRes.equals("未处理")) {
				veri.setVres(0);
				veri.setVstatus(0); // 处理状态置为未处理
			} else if (processRes.equals("已通过")) {
				veri.setVres(1);
				veri.setVstatus(1); // 处理状态置为处理
			} else if (processRes.equals("不通过")) {
				veri.setVres(2);
				veri.setVstatus(1); // 处理状态置为处理
			}

			verificationService.update(veri);
			String update = json_queryVeri(); // 调用json_queryVeri更新显示

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateVeri_success";
	}

	/* 广告管理 */
	/**
	 * 根据id查询单个广告
	 * 
	 * @return
	 */
	public String json_querySingleAd() {
		System.out.println("json_querySingleAd执行: " + AId);

		try {
			dataMap_Ad = new HashMap<String, Object>();
			// List list = usersService.findByUAccount(uAccount);
			Advertisement res = advertisementService.findById(Integer
					.parseInt(AId));
			dataMap_Ad.put("ad", res);
			dataMap_Ad.put("success_queryUser", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回结果
		return "findSignleAd_success";
	}

	/**
	 * 查询所有广告并分页
	 * 
	 * @return
	 */
	public String json_queryAllAd() {
		System.out.println("json_queryAllAd执行...");
		/* 判断查询类型 */

		try {
			dataMap_Ad = new HashMap<String, Object>();
			List<Advertisement> adList = advertisementService.findAll();

			/* 分页，接收分页后list和分页页数 */
			Map<String, Object> tmp = PageMan.cutAdPage(adList, ad_pageIndex,
					ad_pageSize);

			dataMap_Ad.put("adList", tmp.get("newList"));
			dataMap_Ad.put("ad_pageCount", tmp.get("pageCount"));

			dataMap_Ad.put("ad_pageIndex", ad_pageIndex);
			dataMap_Ad.put("ad_pageSize", ad_pageSize);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 返回结果
		return "findAllAd_success";
	}

	/**
	 * 更新对广告信息的修改
	 * 
	 * @return
	 */
	public String json_updateAd() {
		System.out.println("json_updateAd执行: " + ad.getId() + ","
				+ ad.getAdContent() + "," + ad.getStartDate());

		try {
			advertisementService.update(ad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * 新增广告
	 */
	public String json_saveAd() {
		System.out.println("json_saveAd执行...");
		try {
			advertisementService.save(ad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * 删除广告
	 */
	public String json_deleteAd() {
		System.out.println("json_deleteAd执行...");
		try {
			Advertisement tmp = advertisementService.findById(Integer
					.parseInt(AId));
			advertisementService.delete(tmp);
			String call = json_queryAllAd();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	

	
	

	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}

	public void setHouseSellRentService(
			HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}

	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}

	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}

	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}

	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}

	public Map<String, Object> getDataMap_AllHouse() {
		return dataMap_AllHouse;
	}

	public void setDataMap_AllHouse(Map<String, Object> dataMap_AllHouse) {
		this.dataMap_AllHouse = dataMap_AllHouse;
	}

	public String getHId() {
		return HId;
	}

	public void setHId(String hId) {
		HId = hId;
	}

	public int getHouse_pageIndex() {
		return house_pageIndex;
	}

	public void setHouse_pageIndex(int house_pageIndex) {
		this.house_pageIndex = house_pageIndex;
	}

	public int getHouse_pageSize() {
		return house_pageSize;
	}

	public void setHouse_pageSize(int house_pageSize) {
		this.house_pageSize = house_pageSize;
	}

	public int getHouse_pageCount() {
		return house_pageCount;
	}

	public void setHouse_pageCount(int house_pageCount) {
		this.house_pageCount = house_pageCount;
	}

	public String getHouse_queryMode() {
		return house_queryMode;
	}

	public void setHouse_queryMode(String house_queryMode) {
		this.house_queryMode = house_queryMode;
	}

	/**/
	public VerificationService getVerificationService() {
		return verificationService;
	}

	public void setVerificationService(VerificationService verificationService) {
		this.verificationService = verificationService;
	}

	public Map<String, Object> getDataMap_Veri() {
		return dataMap_Veri;
	}

	public void setDataMap_Veri(Map<String, Object> dataMap_Veri) {
		this.dataMap_Veri = dataMap_Veri;
	}

	public int getVeri_pageIndex() {
		return veri_pageIndex;
	}

	public void setVeri_pageIndex(int veri_pageIndex) {
		this.veri_pageIndex = veri_pageIndex;
	}

	public int getVeri_pageSize() {
		return veri_pageSize;
	}

	public void setVeri_pageSize(int veri_pageSize) {
		this.veri_pageSize = veri_pageSize;
	}

	public int getVeri_pageCount() {
		return veri_pageCount;
	}

	public void setVeri_pageCount(int veri_pageCount) {
		this.veri_pageCount = veri_pageCount;
	}

	public String getVeri_queryMode() {
		return veri_queryMode;
	}

	public void setVeri_queryMode(String veri_queryMode) {
		this.veri_queryMode = veri_queryMode;
	}

	public String getVId() {
		return VId;
	}

	public void setVId(String vId) {
		VId = vId;
	}

	public Verification getVeri() {
		return veri;
	}

	public void setVeri(Verification veri) {
		this.veri = veri;
	}

	public String getProcessRes() {
		return processRes;
	}

	public void setProcessRes(String processRes) {
		this.processRes = processRes;
	}

	/* 广告管理 */
	public AdvertisementService getAdvertisementService() {
		return advertisementService;
	}

	public void setAdvertisementService(
			AdvertisementService advertisementService) {
		this.advertisementService = advertisementService;
	}

	public Map<String, Object> getDataMap_Ad() {
		return dataMap_Ad;
	}

	public void setDataMap_Ad(Map<String, Object> dataMap_Ad) {
		this.dataMap_Ad = dataMap_Ad;
	}

	public int getAd_pageIndex() {
		return ad_pageIndex;
	}

	public void setAd_pageIndex(int ad_pageIndex) {
		this.ad_pageIndex = ad_pageIndex;
	}

	public int getAd_pageSize() {
		return ad_pageSize;
	}

	public void setAd_pageSize(int ad_pageSize) {
		this.ad_pageSize = ad_pageSize;
	}

	public int getAd_pageCount() {
		return ad_pageCount;
	}

	public void setAd_pageCount(int ad_pageCount) {
		this.ad_pageCount = ad_pageCount;
	}

	public String getAId() {
		return AId;
	}

	public void setAId(String aId) {
		AId = aId;
	}

	public Advertisement getAd() {
		return ad;
	}

	public void setAd(Advertisement ad) {
		this.ad = ad;
	}

	public Map<String, Object> getDataMap_Admin() {
		return dataMap_Admin;
	}

	public void setDataMap_Admin(Map<String, Object> dataMap_Admin) {
		this.dataMap_Admin = dataMap_Admin;
	}

	public Administrator getAdministrator() {
		return administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}

	public AdministratorService getAdministratorService() {
		return administratorService;
	}

	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}

	
	
}
