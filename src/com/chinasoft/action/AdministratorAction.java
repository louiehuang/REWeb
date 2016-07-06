package com.chinasoft.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;

public class AdministratorAction {
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
	
	
	public String json_deleteHouse() {
		System.out.println("json_deleteHouseִ��, ɾ�� " + HId);

		try {
			if (house_queryMode.equals("HouseSellEnterprise")) {
				HouseSellEnterprise house = houseSellEnterpriseService.findById(Integer.parseInt(HId));
				houseSellEnterpriseService.delete(house);	
				// ɾ�������ǰ̨��ҵ�·�����ʾ
				String update = json_queryAllHouse(); //����Ҫ���շ���ֵ
			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				HouseSellSecondhand house = houseSellSecondhandService.findById(Integer.parseInt(HId));
				houseSellSecondhandService.delete(house);	
				// ɾ�������ǰ̨���ַ�����ʾ
				String update = json_queryAllHouse(); //����Ҫ���շ���ֵ
			} else if (house_queryMode.equals("HouseSellRent")) {
				HouseSellRent house = houseSellRentService.findById(Integer.parseInt(HId));
				houseSellRentService.delete(house);	
				// ɾ�������ǰ̨���ַ�����ʾ
				String update = json_queryAllHouse(); //����Ҫ���շ���ֵ
			}
			dataMap_AllHouse.put("deleteHouse_success", true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// ���ؽ��
		return "deleteHouse_success";
	}
	
	
	public String json_queryAllHouse() {
		System.out.println("json_queryAllHouseִ��, ��ѯ:" + house_queryMode);
		/* �жϲ�ѯ���� */

		try {
			dataMap_AllHouse = new HashMap<String, Object>();

			if (house_queryMode.equals("HouseSellEnterprise")) {
				List<HouseSellEnterprise> enterList = houseSellEnterpriseService
						.findAll();
				enterList = cutPage(enterList, house_pageIndex, house_pageSize); //��ҳ
				dataMap_AllHouse.put("enterList", enterList);
			} else if (house_queryMode.equals("HouseSellSecondhand")) {
				List<HouseSellSecondhand> secondList = houseSellSecondhandService
						.findAll();
				secondList = cutPage(secondList, house_pageIndex, house_pageSize); //��ҳ
				dataMap_AllHouse.put("secondList", secondList);
			} else if (house_queryMode.equals("HouseSellRent")) {
				List<HouseSellRent> rentList = houseSellRentService.findAll();
				rentList = cutPage(rentList, house_pageIndex, house_pageSize); //��ҳ
				dataMap_AllHouse.put("rentList", rentList);

			}

			dataMap_AllHouse.put("house_pageIndex", house_pageIndex);
			dataMap_AllHouse.put("house_pageSize", house_pageSize);
			dataMap_AllHouse.put("house_pageCount", house_pageCount);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// ���ؽ��
		return "findAllHouse_success";
	}
	
	
	/**
	 * ���ݵ�ǰ����ҳ �� ÿҳ��С���з�ҳ
	 * @param list
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List cutPage(List list, int pageIndex, int pageSize) {
		List newList = new ArrayList();
		
		if (list != null) {
			if (list.size() % pageSize == 0) {
				house_pageCount = list.size() / pageSize;
			} else {
				house_pageCount = list.size() / pageSize + 1;
			}

			int start = (pageIndex - 1) * pageSize;
			int end = pageIndex * pageSize;
			if (end > list.size()) {
				end = list.size();
			}

			for (int i = start; i < end; i++) {
				newList.add(list.get(i));
			}
		}
		
		return newList;
	}

	
	
	
	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}
	public void setHouseSellRentService(HouseSellRentService houseSellRentService) {
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
	
	
}
