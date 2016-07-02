package com.chinasoft.action;

import java.util.List;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;

/**
 * ��ҳAction<br/>
 * ������ҳ��ʾ����Ϣ<br/>
 * ÿ�μ�����ҳʱ����LoadInfo()����<br/>
 * @author hlyin
 *
 */
public class IndexAction {
	static int i = 1;

	/**
	 * ���ⷿ�ݷ���
	 */
	private HouseSellRentService houseSellRentService;

	/**
	 * ��ҵ�·�����
	 */
	private HouseSellEnterpriseService houseSellEnterpriseService;

	/**
	 * ���۶��ַ�����
	 */
	private HouseSellSecondhandService houseSellSecondhandService;

	/**
	 * ��ҳ������Ϣ�б�
	 */
	private List<HouseSellRent> houseSellRentList;

	/**
	 * ��ҳ��ҵ¥����Ϣ�б�
	 */
	private List<HouseSellEnterprise> houseSellEnterpriseList;

	/**
	 * ��ҳ���۶��ַ���Ϣ�б�
	 */
	private List<HouseSellSecondhand> houseSellSecondhandList;

	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}

	public void setHouseSellRentService(
			HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}

	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}

	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}

	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}

	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}

	public List<HouseSellRent> getHouseSellRentList() {
		return houseSellRentList;
	}

	public void setHouseSellRentList(List<HouseSellRent> houseSellRentList) {
		this.houseSellRentList = houseSellRentList;
	}

	public List<HouseSellEnterprise> getHouseSellEnterpriseList() {
		return houseSellEnterpriseList;
	}

	public void setHouseSellEnterpriseList(
			List<HouseSellEnterprise> houseSellEnterpriseList) {
		this.houseSellEnterpriseList = houseSellEnterpriseList;
	}

	public List<HouseSellSecondhand> getHouseSellSecondhandList() {
		return houseSellSecondhandList;
	}

	public void setHouseSellSecondhandList(
			List<HouseSellSecondhand> houseSellSecondhandList) {
		this.houseSellSecondhandList = houseSellSecondhandList;
	}

	/**
	 * ������ҳ�ķ�����Ϣ��
	 * ���ⷿ�ݡ���ҵ�·������۶��ַ�
	 * @return
	 */
	public String LoadInfo() {
		try {
			// ���ݳ�����Ϣ
			houseSellRentList = houseSellRentService.getRentInfo();

			// �·�������Ϣ
			houseSellEnterpriseList = houseSellEnterpriseService.getSellNewInfo();

			// ���ַ�������Ϣ
			houseSellSecondhandList = houseSellSecondhandService.getSellOldInfo();

			// System.out.println("��" + i + "����ɼ�����Ϣ");
			// i++;
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}

		return "success";
	}

	
	/**
	 * ��ҵ�·���ȡ����
	 * 
	 * @return
	 */
	public List<HouseSellEnterprise> Test1() {
		return houseSellEnterpriseService.getSellNewInfo();
	}

	public List<HouseSellRent> Test2() {
		return houseSellRentService.getRentInfo();
	}


}
