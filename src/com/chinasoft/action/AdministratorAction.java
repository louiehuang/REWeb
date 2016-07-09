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
	/*����Ա*/
	private Map<String, Object> dataMap_Admin;
	private AdministratorService administratorService;
	private Administrator administrator;
	private HttpSession session;
	
	/* ��ѯ���� */
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellRentService houseSellRentService;

	private Map<String, Object> dataMap_AllHouse;
	private String HId;
	private int house_pageIndex = 1;
	private int house_pageSize = 10; // Ĭ�Ϸ�ҳ��С
	private int house_pageCount = 0;
	private String house_queryMode;

	/* ��ѯ��֤ */
	private VerificationService verificationService;
	private Map<String, Object> dataMap_Veri;
	private int veri_pageIndex = 1;
	private int veri_pageSize = 10; // Ĭ�Ϸ�ҳ��С
	private int veri_pageCount = 0;
	private String veri_queryMode;
	private String VId; // ��֤��id
	private Verification veri; // ��֤����
	private String processRes; // ������

	/* ������ */
	private AdvertisementService advertisementService;
	private Map<String, Object> dataMap_Ad;
	private int ad_pageIndex = 1;
	private int ad_pageSize = 10; // Ĭ�Ϸ�ҳ��С
	private int ad_pageCount = 0;
	private String AId; // ��֤��id
	private Advertisement ad; // ��֤����

	
	/**
	 * ����Ա��¼�ж�
	 * @return
	 */
	public String json_loginAdminUser(){
		String uAccount = administrator.getAccount();
		String pwd = Encryption.getMD5(administrator.getPwd()); // ����
		administrator.setPwd(pwd);

		System.out.println("json_loginEnterUserִ��: " + uAccount + ", " + pwd);

		try {
			dataMap_Admin = new HashMap<String, Object>();
			List<Administrator> list = administratorService.findByExample(administrator);

			// ��½��־��userLoginFlagΪ1��ʾ��½ʧ�ܣ�û�ж�Ӧ�˻�
			if (list.size() == 0) {
				System.out.println("��½ʧ��");
				dataMap_Admin.put("adminLoginFlag", "1");
			} else {
				// users����session
				System.out.println("��½�ɹ�");
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("adminUsers", list.get(0));

				dataMap_Admin.put("adminLoginFlag", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "admin_login_success";
		
	}
	
	/**
	 * �˳���½ �Ƴ�session�еĹ���Ա��adminUsers
	 * @return
	 */
	public String signOut() {
		System.out.println("signOut����Ա�û�ִ��...");
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (session.getAttribute("adminUsers") != null) {
			session.removeAttribute("adminUsers");
		}else{
			System.out.println("signOut: û�е�½����Ա�û�");
		}
		
		return "signout";
	}
	
	
	
	/**
	 * ɾ��������Ϣ���������б�
	 * 
	 * @return
	 */
	public String json_deleteHouse() {
		System.out.println("json_deleteHouseִ��, ɾ�� " + HId);

		try {
			if (house_queryMode.equals("HouseSellEnterprise")) {
				HouseSellEnterprise house = houseSellEnterpriseService
						.findById(Integer.parseInt(HId));
				houseSellEnterpriseService.delete(house);
				// ɾ�������ǰ̨��ҵ�·�����ʾ
				String update = json_queryAllHouse(); // ����Ҫ���շ���ֵ
			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				HouseSellSecondhand house = houseSellSecondhandService
						.findById(Integer.parseInt(HId));
				houseSellSecondhandService.delete(house);
				// ɾ�������ǰ̨���ַ�����ʾ
				String update = json_queryAllHouse(); // ����Ҫ���շ���ֵ
			} else if (house_queryMode.equals("HouseSellRent")) {
				HouseSellRent house = houseSellRentService.findById(Integer
						.parseInt(HId));
				houseSellRentService.delete(house);
				// ɾ�������ǰ̨���ַ�����ʾ
				String update = json_queryAllHouse(); // ����Ҫ���շ���ֵ
			}
			dataMap_AllHouse.put("deleteHouse_success", true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "deleteHouse_success";
	}

	/**
	 * ��ѯ���з�����Ϣ������ҳ
	 * 
	 * @return
	 */
	public String json_queryAllHouse() {
		System.out.println("json_queryAllHouseִ��, ��ѯ:" + house_queryMode);
		/* �жϲ�ѯ���� */

		try {
			dataMap_AllHouse = new HashMap<String, Object>();

			if (house_queryMode.equals("HouseSellEnterprise")) {
				List<HouseSellEnterprise> enterList = houseSellEnterpriseService
						.findAll();

				/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
				Map<String, Object> tmp = PageMan.cutHousePage(enterList,
						house_pageIndex, house_pageSize);
				dataMap_AllHouse.put("enterList", tmp.get("newList"));
				dataMap_AllHouse.put("house_pageCount", tmp.get("pageCount"));

			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				List<HouseSellSecondhand> secondList = houseSellSecondhandService
						.findAll();

				/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
				Map<String, Object> tmp = PageMan.cutHousePage(secondList,
						house_pageIndex, house_pageSize);

				dataMap_AllHouse.put("secondList", tmp.get("newList"));
				dataMap_AllHouse.put("house_pageCount", tmp.get("pageCount"));

			} else if (house_queryMode.equals("HouseSellRent")) {
				List<HouseSellRent> rentList = houseSellRentService.findAll();

				/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
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

		// ���ؽ��
		return "findAllHouse_success";
	}

	/**
	 * ��ѯ������֤���벢��ҳ
	 * 
	 * @return
	 */
	public String json_queryVeri() {
		System.out.println("json_queryVeriִ��, ��ѯ:" + veri_queryMode);
		/* �жϲ�ѯ���� */

		try {
			dataMap_Veri = new HashMap<String, Object>();

			if (veri_queryMode.equals("queryVerificaton")) {
				int status = 0; // ��ѯδ�����
				List<Verification> unprocessedList = verificationService
						.findByVstatus(status);

				/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
				Map<String, Object> tmp = PageMan.cutVeriPage(unprocessedList,
						veri_pageIndex, veri_pageSize);

				dataMap_Veri.put("unprocessedList", tmp.get("newList"));
				dataMap_Veri.put("veri_pageCount", tmp.get("pageCount"));

			} else if (veri_queryMode.equals("queryVerificaton_processed")) {
				int status = 1;
				List<Verification> processedList = verificationService
						.findByVstatus(status);

				/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
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

		// ���ؽ��
		return "findVeri_success";
	}

	/**
	 * ������֤����������������Ӧ״̬�������Ϊδ����ʱ״̬��Ϊδ����0��
	 * 
	 * @return
	 */
	public String json_updateVeri() {
		System.out.println("json_updateVeriִ��...");
		try {
			Verification veri = verificationService.findById(Integer
					.parseInt(VId));

			System.out.println(processRes);

			if (processRes.equals("δ����")) {
				veri.setVres(0);
				veri.setVstatus(0); // ����״̬��Ϊδ����
			} else if (processRes.equals("��ͨ��")) {
				veri.setVres(1);
				veri.setVstatus(1); // ����״̬��Ϊ����
			} else if (processRes.equals("��ͨ��")) {
				veri.setVres(2);
				veri.setVstatus(1); // ����״̬��Ϊ����
			}

			verificationService.update(veri);
			String update = json_queryVeri(); // ����json_queryVeri������ʾ

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateVeri_success";
	}

	/* ������ */
	/**
	 * ����id��ѯ�������
	 * 
	 * @return
	 */
	public String json_querySingleAd() {
		System.out.println("json_querySingleAdִ��: " + AId);

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
		// ���ؽ��
		return "findSignleAd_success";
	}

	/**
	 * ��ѯ���й�沢��ҳ
	 * 
	 * @return
	 */
	public String json_queryAllAd() {
		System.out.println("json_queryAllAdִ��...");
		/* �жϲ�ѯ���� */

		try {
			dataMap_Ad = new HashMap<String, Object>();
			List<Advertisement> adList = advertisementService.findAll();

			/* ��ҳ�����շ�ҳ��list�ͷ�ҳҳ�� */
			Map<String, Object> tmp = PageMan.cutAdPage(adList, ad_pageIndex,
					ad_pageSize);

			dataMap_Ad.put("adList", tmp.get("newList"));
			dataMap_Ad.put("ad_pageCount", tmp.get("pageCount"));

			dataMap_Ad.put("ad_pageIndex", ad_pageIndex);
			dataMap_Ad.put("ad_pageSize", ad_pageSize);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// ���ؽ��
		return "findAllAd_success";
	}

	/**
	 * ���¶Թ����Ϣ���޸�
	 * 
	 * @return
	 */
	public String json_updateAd() {
		System.out.println("json_updateAdִ��: " + ad.getId() + ","
				+ ad.getAdContent() + "," + ad.getStartDate());

		try {
			advertisementService.update(ad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * �������
	 */
	public String json_saveAd() {
		System.out.println("json_saveAdִ��...");
		try {
			advertisementService.save(ad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * ɾ�����
	 */
	public String json_deleteAd() {
		System.out.println("json_deleteAdִ��...");
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

	/* ������ */
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
